
import AppKit

class ConferenceController {
  
  let videoSession: VideoSession
  let view: NSView
  let videoPreviewView: VideoPreviewView
  
  init() {
    videoSession = VideoSession()
    view = NSView()
    videoPreviewView = VideoPreviewView(session: videoSession)
    videoSession.delegate = self
    view.addSubview(videoPreviewView)
    videoPreviewView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    videoPreviewView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    videoPreviewView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    videoPreviewView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    videoPreviewView.hide()
  }
  
}

extension ConferenceController: VideoSessionDelegate {
  
  func didFail(session: VideoSession) {
    
  }

  func didStop(session: VideoSession) {
    
  }

  func didStart(session: VideoSession) {
    videoPreviewView.showAnimated()
  }
  
  func videoSession(_ session: VideoSession, didReceiveBuffer buffer: Data) {
    
  }
  
}
