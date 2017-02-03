import Foundation


class Wings {

    var resp = Response()

    private func doRequest(method: String, url: String, body: Any?, headers:[AnyHashable : Any]?, timeout: Double) -> Response? {
        let urlPath: String = url
        let url = URL(string: urlPath)!
        var request: URLRequest = URLRequest(url: url)

        request.httpMethod = method
        request.timeoutInterval = timeout

        let session = URLSession.shared
        let semaphore = DispatchSemaphore.init(value:0)

        let task = session.dataTask(with: request)  { (data, response, error) in
            let r = response as! HTTPURLResponse
            self.resp.statusCode = r.statusCode
            self.resp.headers = r.allHeaderFields
            self.resp.data = data
            semaphore.signal()
        }

        task.resume()

        let _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return self.resp
    }

    public func get(url: String, headers:[String: Any]?) -> Response? {
      let hashableHeaders = headers as [AnyHashable: Any]?
      return self.doRequest(method:"GET", url: url, body: nil, headers: hashableHeaders, timeout:60)
    }

}
