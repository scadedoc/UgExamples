import Foundation
import NIO
import ScadeKit

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

  func start() async throws -> Bool {
    do {
      let bootstrap = ClientBootstrap(group: group)
        .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
        .channelInitializer { channel in
          channel.pipeline.addHandler(TCPClientHandler(client: self))
        }

      channel = try await bootstrap.connect(host: host, port: port).wait()
      return true
    } catch let error {
      print(error)
      return false
    }
  }

  func callDataHandler(data: String) -> String {
    dataHandler(data)
    return data

  }

}

class MainPageAdapter: SCDLatticePageAdapter {
  var client: TCPClient?

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    var currHostString: String = ""
    var currPortString: String = ""

    self.host_tb.onTextChange.append(
      SCDWidgetsTextChangeEventHandler { ev in
        currHostString = ev!.newValue
      })

    self.port_tb.onTextChange.append(
      SCDWidgetsTextChangeEventHandler { ev in
        currPortString = ev!.newValue
      })

    self.getdata_btn.onClick { _ in
      print("\(currHostString) \(currPortString)")

      if currHostString.isEmpty || currPortString.isEmpty {
        print("Host or Port is Empty")
        return
      }

      self.client = TCPClient(host: currHostString, port: Int(currPortString)!) {
        data in
        print(data)
        let stringData: String = String(data)
        let a = stringData.index(stringData.startIndex, offsetBy: 500)
        let result = stringData.substring(to: a)
        self.response_label.text = result
      }

      Task {
        let result = try await self.client?.start()
      }

    }

  }
}
