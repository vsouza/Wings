import Foundation


class Request {

    var statusCode: Int?
    var headers: [String: Any]?


    public func prepareRequest(method: String, url: String) -> [String: Any]? {
        var result: [String: Any]?

        let urlPath: String = "http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC&limit=1"
        let url: URL = URL(string: urlPath)!
        var request: URLRequest = URLRequest(url: url)

        request.httpMethod = method
        request.timeoutInterval = 60

        let session = URLSession.shared
        let semaphore = DispatchSemaphore.init(value:0)

        let task = session.dataTask(with: request)  { (data, response, error) in
            // print(data.statusCode)

            let r = response as! HTTPURLResponse
            print(r.allHeaderFields["Content-Length"] as Any)
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

}
