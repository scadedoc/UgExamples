
import foo

public func fooWrapper() -> String {
  String(cString: foo())
}

