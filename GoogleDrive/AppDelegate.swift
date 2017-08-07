
import AppKit

class AppDelegate: NSObject {
  
  let window = NSWindow(centeredWithSize: Appearance.windowSize)
  
}

extension AppDelegate: NSApplicationDelegate {
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    window.makeKeyAndOrderFront(self)
  }
  
}
