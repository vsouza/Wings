# Wing
> [In Development] Pure Swfit cURL Requests.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![codebeat-badge][codebeat-image]][codebeat-url]

One to two paragraph statement about your product and what it does.

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
let req = wing.API()
req.get(url:"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC&limit=1")
```

__get body__

```swift
req.body
```

__headers__

```swift
req.headers
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

[https://github.com/yourname/github-link](https://github.com/dbader/)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/vsouza/wing/master.svg
[travis-url]: https://travis-ci.org/vsouza/wing
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-wing
