
import AppKit

func UtilCreateWindow() -> NSWindow {
  let screenFrame = NSScreen.main()!.frame
  let widthOffset = screenFrame.size.width / 8
  let heightOffset = screenFrame.size.height / 8
  let windowFrame = screenFrame.insetBy(dx: widthOffset, dy: heightOffset).offsetBy(dx: 0, dy: heightOffset)
  let styleMask = [.titled, .closable, .miniaturizable, .resizable] as NSWindowStyleMask
  let window = NSWindow(contentRect: windowFrame, styleMask: styleMask, backing: .buffered, defer: false)
  return window
}
