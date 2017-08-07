
import AVFoundation

class VideoSession: NSObject {
  
  static let shared = VideoSession()
  
  let session: AVCaptureSession
  let camera: AVCaptureDevice
  let input: AVCaptureDeviceInput
  let output: AVCaptureVideoDataOutput
  let sampleBufferQueue: DispatchQueue
  let previewLayer: AVCaptureVideoPreviewLayer
  
  var onSampleBufferCallback: SampleBufferCallback?
  
  override init() {
    session = AVCaptureSession()
    camera = AVCaptureDevice.default(for: .video)!
    input = try! AVCaptureDeviceInput(device: camera)
    output = AVCaptureVideoDataOutput()
    sampleBufferQueue = DispatchQueue(label: "CameraBufferQueue")
    previewLayer = AVCaptureVideoPreviewLayer(session: session)
    super.init()
    session.sessionPreset = .medium
    session.addInput(input)
    session.addOutput(output)
    output.videoSettings = [
      AVVideoCodecKey: AVVideoCodecH264
    ]
    output.setSampleBufferDelegate(self, queue: sampleBufferQueue)
  }
  
  func start(onSampleBuffer: @escaping SampleBufferCallback) {
    onSampleBufferCallback = onSampleBuffer
    session.startRunning()
  }
  
}

extension VideoSession: AVCaptureVideoDataOutputSampleBufferDelegate {
  
  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
    let videoData = Data()
    onSampleBufferCallback?(videoData)
  }
  
}

extension VideoSession {
  
  typealias SampleBufferCallback = (Data) -> Void
  
}
