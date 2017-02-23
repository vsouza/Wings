import Foundation
import Dispatch

public class Wings {

    var resp = Response()
    
    public init() {
       // This initializer intentionally left empty
    }

    private func doRequest(method: String, url: String, body: Data?, headers:[String: String]?, timeout: Double) -> Response? {
        let urlPath: String = url
        let url = URL(string: urlPath)!
        var request: URLRequest = URLRequest(url: url)

        request.httpMethod = method
        request.timeoutInterval = timeout
        request.allHTTPHeaderFields = headers

        if let httpBody = body { 
            request.httpBody = httpBody
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

    public func post(url: String, headers:[String: String]?, body: Data?) -> Response? {
        guard let reqBody = body else {
            return nil
        }
        return self.doRequest(method:"POST", url: url, body: reqBody, headers: headers, timeout: 60)
    }

    public func put(url: String, headers:[String: String]?, body: Data?) -> Response? {
        guard let reqBody = body else {
            return nil
        }
        return self.doRequest(method:"PUT", url: url, body: reqBody, headers: headers, timeout: 60)
    }

    public func delete(url: String, headers:[String: String]?, body: Data?) -> Response? {
        guard let reqBody = body else {
            return nil
        }
        return self.doRequest(method:"DELETE", url: url, body: reqBody, headers: headers, timeout: 60)
    }
}
