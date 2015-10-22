# Encodable

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/license-Creative%20Commons%20Zero%20v1.0%20Universal-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

A minimal encoding and decoding protocol for Swift, with built-in JSON and property list support.

Just add:

    typealias Encoded

    static func decode(encoded: Encoded) throws -> Self

    func encode() -> Encoded

To your type to conform.

## Installation

Add:

    github "natestedman/Encodable"

To your `Cartfile`.

## License

[Public domain (CC0)](https://creativecommons.org/publicdomain/zero/1.0/)
