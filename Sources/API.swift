import Foundation

class API {
  private func doRequest(method: String, url: String, body: [String: Any]?, headers: [String: Any]?) -> (Data?, HTTPURLResponse?, Error?) {
    var request: URLRequest = URLRequest(url: URL(string: url)!)
    request.httpMethod = method
    request.timeoutInterval = 60

    let session = URLSession.shared
    let semaphore = DispatchSemaphore.init(value:0)

    var ddata: Data?
    var rresponse: HTTPURLResponse()
    var eerror: Error?

    let task = session.dataTask(with: request)  { (data, response, error) in
        ddata = data
        rresponse = response as! HTTPURLResponse
        eerror = error!
        semaphore.signal()
    }
    task.resume()
    let _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    return (ddata, rresponse, eerror)
  }
  public func get(url: String){
    print(self.doRequest(method:"GET", url:url, body: nil, headers: nil))

  }
  public func options(url: String){
    self.doRequest(method:"OPTION", url:url, body: nil, headers: nil)
  }
  public func head(url: String){
    self.doRequest(method:"HEAD", url:url, body: nil, headers: nil)
  }
  public func post(url: String){
    self.doRequest(method:"POST", url:url, body: nil, headers: nil)
  }
  public func put(url: String){
    self.doRequest(method:"PUT", url:url, body: nil, headers: nil)
  }
  public func delete(url: String){
    self.doRequest(method:"DELETE", url:url, body: nil, headers: nil)
  }
  public func trace(url: String){
    self.doRequest(method:"TRACE", url:url, body: nil, headers: nil)
  }
}
