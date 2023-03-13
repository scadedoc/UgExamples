import ScadeKit
import NIO
import Foundation

public class TCPClientHandler: ChannelInboundHandler {
  public typealias InboundIn = ByteBuffer
  public typealias OutboundOut = ByteBuffer
  private var client: TCPClient
  private var allData: String = ""

  init(client: TCPClient) {
    self.client = client
  }

  // channel is connected, send http request
  public func channelActive(context: ChannelHandlerContext) {
    let message = "GET / HTTP/1.0\r\n\r\n"
    var buffer = context.channel.allocator.buffer(capacity: message.utf8.count)
    buffer.writeString(message)
    context.writeAndFlush(wrapOutboundOut(buffer), promise: nil)
  }

  // channel data available, read data
  public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
    var buffer = unwrapInboundIn(data)
    let readableBytes = buffer.readableBytes
    if let received = buffer.readString(length: readableBytes) {
      allData += received
    }
  }

  // channel closed, invoking data handler
  public func channelInactive(context: ChannelHandlerContext) {
    client.callDataHandler(data: allData)
  }
    
  public func errorCaught(context: ChannelHandlerContext, error: Error) {
    print("error: \(error.localizedDescription)")
    context.close(promise: nil)
  }
}


class TCPClient {
  private let group = MultiThreadedEventLoopGroup(numberOfThreads: 10)
  private var host: String
  private var port: Int
  private var channel: Channel?
  private var dataHandler: (String) -> Void
    
  init(host: String, port: Int, dataHandler: @escaping (String) -> Void) {
    self.host = host
    self.port = port
    self.dataHandler = dataHandler
  }
    
  func start() throws {
    do {
    let bootstrap = ClientBootstrap(group: group)
      .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
      .channelInitializer { channel in
        channel.pipeline.addHandler(TCPClientHandler(client: self))
      }

      channel = try bootstrap.connect(host: host, port: port).wait()
    } catch let error {
      throw error
    }
  }

  func callDataHandler(data: String) {
    dataHandler(data)
  }
}


class MainPageAdapter: SCDLatticePageAdapter {
  var client: TCPClient

  override init() {
    client = TCPClient(host: "google.com", port: 80) { data in
      print("RECEIVED DATA:\n" + data)
    }
  }

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    do {
      try client.start()
    }
    catch {
      print("ERROR: \(error)")
    }
  }
}
