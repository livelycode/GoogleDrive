
import AppKit

class AppDelegate: NSObject {
  
  let window = UtilCreateWindow()
  
}

extension AppDelegate: NSApplicationDelegate {
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    window.makeKeyAndOrderFront(self)
  }
  
}
