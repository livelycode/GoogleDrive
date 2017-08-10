
import AppKit

class ConferenceController {
  
  let videoSession: VideoSession
  let view: NSView
  
  init() {
    videoSession = VideoSession()
    view = NSView()
    videoSession.delegate = self
    view.layer = videoSession.previewLayer
  }
  
}

extension ConferenceController: VideoSessionDelegate {
  
  func didFail(session: VideoSession) {
    
  }

  func didStop(session: VideoSession) {
    
  }

  func didStart(session: VideoSession) {
    
  }
  
  func videoSession(_ session: VideoSession, didReceiveBuffer buffer: Data) {
    
  }
  
}
