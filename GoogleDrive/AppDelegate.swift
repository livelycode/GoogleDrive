
import AppKit

class AppDelegate: NSObject {
  
  let window: NSWindow
  let api = GoogleDriveApi()
  
  override init() {
    let windowFrame = CGSize(width: 300, height: 400)
    window = NSWindow(size: windowFrame)
    super.init()
  }
  
}

extension AppDelegate: NSApplicationDelegate {
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    window.makeKeyAndOrderFront(self)
    api.list()
  }
  
}
