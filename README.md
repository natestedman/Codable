# Encodable

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Github Releases](https://img.shields.io/github/downloads/natestedman/Encodable/latest/total.svg)](https://github.com/natestedman/Encodable/releases) [![GitHub license](https://img.shields.io/github/license/natestedman/Encodable.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

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