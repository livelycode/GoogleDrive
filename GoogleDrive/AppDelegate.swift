
import AppKit

class AppDelegate: NSObject {
  
  let window = NSWindow(centeredWithSize: Appearance.windowSize)
  let conferenceController = ConferenceController()
  
}

extension AppDelegate: NSApplicationDelegate {
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    window.contentView = conferenceController.view
    window.makeKeyAndOrderFront(self)
    conferenceController.videoSession.start()
  }
  
}
