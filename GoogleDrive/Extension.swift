
import AppKit

extension NSApplication {
  
  static func run() {
    let delegate = AppDelegate()
    NSApplication.shared().delegate = delegate
    NSApplication.shared().run()
  }
  
}
