# Codable

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/natestedman/Codable.svg?branch=master)](https://travis-ci.org/natestedman/Codable)
[![License](https://img.shields.io/badge/license-Creative%20Commons%20Zero%20v1.0%20Universal-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

Minimal encoding and decoding protocols for Swift, with built-in JSON and property list support.

Just add:

    typealias Encoded

Then either:

    static func decode(encoded: Encoded) throws -> Self

Or:

    func encode() -> Encoded

To your type to conform (or both).

## Documentation
If necessary, install `jazzy`:

    gem install jazzy
   
Then run:

    make docs

To generate HTML documentation in the `Documentation` subdirectory.

## Installation

Add:

    github "natestedman/Encodable"

To your `Cartfile`.

## License

[Public domain (CC0)](https://creativecommons.org/publicdomain/zero/1.0/)
