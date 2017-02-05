import Foundation

struct Response {

  var statusCode: Int?
  var headers: [AnyHashable : Any]?
  var data: Data?
  var json: [String: Any]? {
    get{
      var jsonResponse: [String: Any]?
      do {
        let jsonOptions = JSONSerialization.ReadingOptions.mutableContainers
        jsonResponse = try JSONSerialization.jsonObject(with: self.data!, options: jsonOptions) as? [String: Any]
      } catch {
        return nil
      }
      return jsonResponse
    }
  }
  var text: String? {
    return String(data: self.data!, encoding: .utf8)
  }
}
