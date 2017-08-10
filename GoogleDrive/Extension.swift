
import AppKit

extension NSApplication {
  
  static func run() {
    let delegate = AppDelegate()
    NSApplication.shared().delegate = delegate
    NSApplication.shared().run()
  }
  
}

extension NSWindow {
  
  convenience init(centeredWithSize size: CGSize) {
    let screenFrame = NSScreen.main()!.frame
    let deltaX = (screenFrame.size.width - size.width) / 2
    let deltaY = (screenFrame.size.height - size.height) / 2
    let windowFrame = screenFrame.insetBy(dx: deltaX, dy: deltaY)
    let styleMask = [
      .titled,
      .fullSizeContentView,
      .closable,
      .miniaturizable,
      .resizable
    ] as NSWindowStyleMask
    self.init(contentRect: windowFrame, styleMask: styleMask, backing: .buffered, defer: false)
    titlebarAppearsTransparent = true
  }
  
  var standartButtons: [NSButton] {
    let buttons = [
      standardWindowButton(.closeButton),
      standardWindowButton(.miniaturizeButton),
      standardWindowButton(.zoomButton),
      standardWindowButton(.toolbarButton),
      standardWindowButton(.documentIconButton),
      standardWindowButton(.documentVersionsButton)
    ]
    return buttons.flatMap { button in
      return button
    }
  }
  
}
