<img src="header.png" width="800" align="center" />

# Wings
> Pure Swift cURL Requests.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![codebeat-badge][codebeat-image]][codebeat-url]

Inspired on [Python Requests](https://github.com/kennethreitz/requests).

A beautiful HTTP Client for your Swift projects.


## Installation

Add this project on your `Package.swift`

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/vsouza/wings.git", majorVersion: 0, minor: 0)
    ]
)
```

## Usage example


### GET
```swift
import Wings
let w = Wings()
if let response = w.get(url:"http://localhost:8080/", headers:nil){

  print(response) \\ Response() struct type

  print(response.headers) \\ list of headers [AnyHashable : Any]?
  print(response.statusCode) \\ (Int?)

  print(response.json) \\ json response ([String: Any]?)
  print(response.text) \\ text response (String?)

}
```

### POST JSON

```swift
import Wings

var headers: [String: String] = ["Content-Type": "application/json"]
var body : [String: Any] = ["owner": "vsouza"]
let jsonBody = try? JSONSerialization.data(withJSONObject: body)

let w = Wings()
if let response = w.post(url: "http://localhost:8080/", headers: headers, body:jsonBody) {
    if let json = response.json{
        print(json["owner"]) // vsouza
    }
}

```


## Release History

* 0.0.1
    * Work in progress

## Meta

Vinicius Souza – [@iamvsouza](https://twitter.com/iamvsouza) – hi@vsouza.com

Distributed under the MIT license. See [License](http://vsouza.mit-license.org/)

[https://github.com/vsouza](https://github.com/vsouza/)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/vsouza/wings/master.svg
[travis-url]: https://travis-ci.org/vsouza/wings
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-wings
