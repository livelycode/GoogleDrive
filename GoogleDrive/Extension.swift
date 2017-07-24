
import AppKit

extension NSApplication {
  
  static func run() {
    let delegate = AppDelegate()
    NSApplication.shared().delegate = delegate
    NSApplication.shared().run()
  }
  
}

extension NSWindow {
  
  convenience init(size: CGSize) {
    let screenFrame = NSScreen.main()!.frame
    let deltaX = (screenFrame.size.width - size.width) / 2
    let deltaY = (screenFrame.size.height - size.height) / 2
    let windowFrame = screenFrame.insetBy(dx: deltaX, dy: deltaY)
    let styleMask = [.titled, .closable, .miniaturizable, .resizable] as NSWindowStyleMask
    self.init(contentRect: windowFrame, styleMask: styleMask, backing: .buffered, defer: false)
  }
  
}
