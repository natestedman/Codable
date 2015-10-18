// Encodable
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

import Foundation

/// A protocol that data structures can use to encode and decode themselves.
public protocol Encodable
{
    /// The type that the data structures encodes to and decodes from.
    typealias EncodedType
    
    /**
    Decodes a value, if possible.
    
    - parameter encoded: The encoded data.
    */
    static func decode(encoded: EncodedType) throws -> Self
    
    /// Encodes a value to data.
    func encode() -> EncodedType
}