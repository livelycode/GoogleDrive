
import Foundation

class GoogleDriveApi {
  
  let httpRequest = HttpRequest()
  
  func list() {
    let url = GoogleDriveApiURL(subpath: "files")
    let header = GoogleDriveApiHeader()
    httpRequest.get(url: url, header: header) { request, response, data in
      JsonPrint(data: data!)
    }
  }
  
}

private func GoogleDriveApiURL(subpath: String..., query: [String: String]? = nil) -> URL {
  let path = ["drive", "v3"] + subpath
  var urlComponents = URLComponents()
  urlComponents.scheme = "https"
  urlComponents.host = "www.googleapis.com"
  urlComponents.path = "/" + path.joined(separator: "/")
  urlComponents.queryItems = query?.map { key, value in
    return URLQueryItem(name: key, value: value)
  }
  return urlComponents.url!
}

private func GoogleDriveApiHeader() -> [String: String] {
  return [
    "Authorization": "Bearer ya29.GluRBDT6J4juLyF8D2-I3hVrOWR5uQkUku8AoX7QKse6J0Q0rsNHJSMjLAacrQf9eJbgb5ScYO84pAnqgrvUhO-4k6O-JxmBQZtjTl50WCZQPCLO7dZb96vq2asW"
  ]
}
