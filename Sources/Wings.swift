import Foundation


class Wings {

    var resp = Response()

    private func doRequest(method: String, url: String, body: Data?, headers:[String: String]?, timeout: Double) -> Response? {
        let urlPath: String = url
        let url = URL(string: urlPath)!
        var request: URLRequest = URLRequest(url: url)

        request.httpMethod = method
        request.timeoutInterval = timeout
        request.allHTTPHeaderFields = headers

        if body != nil && method == "POST"{   
            request.httpBody = body
        }

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

    public func get(url: String, headers:[String: String]?) -> Response? {
      return self.doRequest(method:"GET", url: url, body: nil, headers: headers, timeout:60)
    }

}
