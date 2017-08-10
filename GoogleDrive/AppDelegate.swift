
import AppKit

class AppDelegate: NSObject {
  
  let window: NSWindow
  let conferenceController: ConferenceController
  
  override init() {
    window = NSWindow(centeredWithSize: Appearance.windowSize)
    conferenceController = ConferenceController()
    super.init()
  }
  
}

extension AppDelegate: NSApplicationDelegate {
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    window.contentView = conferenceController.view
    window.makeKeyAndOrderFront(self)
    conferenceController.videoSession.start()
  }
  
}
