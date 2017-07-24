
import Foundation

class HttpRequest {
  
  private let session: URLSession
  
  init() {
    let config = URLSessionConfiguration.default
    session = URLSession(configuration: config, delegate: nil, delegateQueue: .main)
  }
  
  func get(url: URL, header: [String: String], callback: @escaping (URLRequest, URLResponse?, Data?) -> Void) {
    var request = URLRequest(url: url)
    request.httpMethod = HttpMethod.get
    request.allHTTPHeaderFields = header
    let task = session.dataTask(with: request) { data, response, error in
      callback(request, response, data)
    }
    task.resume()
  }
  
  func download(from url: URL, callback: @escaping (URLRequest, URLResponse?, Data?) -> Void) {
    let task = session.downloadTask(with: url) { url, response, error in
      
    }
    task.resume()
  }
  
  func upload(file: URL, to url: URL, callback: @escaping (URLRequest, URLResponse?, Data?) -> Void) {
    var request = URLRequest(url: url)
    request.httpMethod = HttpMethod.post
    let task = session.uploadTask(with: request, fromFile: file) { data, response, error in
      
    }
    task.resume()
  }
  
}

struct HttpMethod {
  
  static let get = "GET"
  static let put = "PUT"
  static let post = "POST"
  
}
