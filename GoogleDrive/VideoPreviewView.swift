
import AppKit
import AVFoundation

class VideoPreviewView: NSView {
  
  init(session: VideoSession) {
    let previewLayer = AVCaptureVideoPreviewLayer(session: session.session)!
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
    previewLayer.connection.automaticallyAdjustsVideoMirroring = false
    previewLayer.connection.isVideoMirrored = true
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    wantsLayer = true
    layer = previewLayer
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  func hide() {
    alphaValue = 0
  }
  
  func showAnimated() {
    
    func fade(context: NSAnimationContext) {
      context.duration = 1
      alphaValue = 1
    }
    
    NSAnimationContext.runAnimationGroup(fade)
  }
  
}
