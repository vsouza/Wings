let req = Request()
if let result = req.doRequest(method: "GET", url: "http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC&limit=1"){
    print(result)
}
