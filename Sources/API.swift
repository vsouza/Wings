import Foundation

class API {
  private func doRequest(method: String, url: String, body: [String: Any]?, headers: [String: Any]?) -> [String: Any]?{
    var result: [String: Any]?
    var request: URLRequest = URLRequest(url: URL(string: url)!)

    request.httpMethod = method
    request.timeoutInterval = 60

    let session = URLSession.shared
    let semaphore = DispatchSemaphore.init(value:0)

    let task = session.dataTask(with: request)  { (data, response, error) in
        // print(data.statusCode)

        let r = response as! HTTPURLResponse
        print(r)
        print(r.statusCode)
        semaphore.signal()
        do {
            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any] {
              result = jsonResult
            }
        } catch {
            print("error")
        }
    }

    task.resume()

    let _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    return result
  }
  public func get(url: String){
    self.doRequest(method:"GET", url:url, body: nil, headers: nil)
  }
  public func options(url: String){
    self.doRequest(method:"GET", url:url, body: nil, headers: nil)
  }
  public func head(url: String){
    self.doRequest(method:"GET", url:url, body: nil, headers: nil)
  }
  public func post(url: String){
    self.doRequest(method:"GET", url:url, body: nil, headers: nil)
  }
  public func put(url: String){
    self.doRequest(method:"GET", url:url, body: nil, headers: nil)
  }
  public func delete(url: String){
    self.doRequest(method:"GET", url:url, body: nil, headers: nil)
  }
  public func trace(url: String){
    self.doRequest(method:"GET", url:url, body: nil, headers: nil)
  }
}
