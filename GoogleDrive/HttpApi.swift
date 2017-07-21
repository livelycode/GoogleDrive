
import Foundation

class HttpApi {
  
  private let session = URLSession(configuration: URLSessionConfiguration.background(withIdentifier: "foo"), delegate: nil, delegateQueue: OperationQueue.main)
  private let host: String
  private let pathPrefix: String
  
  init(host: String, pathPrefix: String...) {
    self.host = host
    self.pathPrefix = "/" + pathPrefix.joined(separator: "/")
  }
  
  func request(pathComponents: String..., callback: @escaping (URLRequest, URLResponse?, Data?) -> Void) {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = host
    urlComponents.path = pathPrefix + pathComponents.joined(separator: "/")
    let request = URLRequest(url: urlComponents.url!)
    let task = session.dataTask(with: request) { data, response, error in
      callback(request, response, data)
    }
    task.resume()
  }
  
}
