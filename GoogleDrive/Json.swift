
import Foundation

func JsonPrint(data: Data) {
  let json = try! JSONSerialization.jsonObject(with: data)
  let prettyData = try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
  let prettyString = String(data: prettyData, encoding: .utf8)!
  print(prettyString)
}
