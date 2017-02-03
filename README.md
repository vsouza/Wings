# Wings
> [In Development] Pure Swift cURL Requests.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![codebeat-badge][codebeat-image]][codebeat-url]

Inspired on [Python Request](https://github.com/kennethreitz/requests), this project it's entirely
written in Swift.

It's a simple, reliable and beautiful HTTP Client to general purpose.

![](header.png)

## Installation

Add this project on your `Package.swift`

```swift
import Wing

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/vsouza/wing.git", majorVersion: 0, minor: 0)
    ]
)
```

## Usage example


```swift
import Wing
let w = Wings()
if let req = w.get(url:"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC&limit=1", headers:nil){
  print(req) \\ prints a Response() type
}
```

__JSON__
```swift
import Wing
let w = Wings()
if let req = w.get(url:"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC&limit=1", headers:nil){
  print(req.json)
}
```

__headers__

```swift
req.headers
```

__Status Code__

```swift
req.statusCode
```


## Development setup

__Install swiftenv__

See: [swiftenv](https://github.com/kylef/swiftenv)

then run:

```sh
make install
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
