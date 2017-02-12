import Foundation

public struct Response {

  public var statusCode: Int?
  public var headers: [AnyHashable : Any]?
  public var data: Data?
  public var json: [String: Any]? {
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
  public var text: String? {
    return String(data: self.data!, encoding: .utf8)
  }
}
