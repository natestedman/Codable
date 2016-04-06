// Codable
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

/// A protocol that data structures can use to decode themselves.
public protocol Decodable
{
    // MARK: - Encoded Type
    
    /// The type that the data structure decodes from.
    associatedtype Encoded
    
    // MARK: - Decoding
    
    /**
    Decodes a value, if possible.
    
    - parameter encoded: A value of the encoded type to decode from.
    */
    static func decode(encoded: Encoded) throws -> Self
}

// MARK: - Extensions
public extension Decodable
{
    // MARK: - Any
    
    /**
    Decodes an `Any?` if possible.
    
    - parameter any: The value to decode.
    
    - throws: `CodableError.CouldNotConvertAnyToEncoded`
    */
    public static func decodeAny(any: Any?) throws -> Self
    {
        if let encoded = any as? Encoded
        {
            return try decode(encoded)
        }
        else
        {
            throw CodableError.CouldNotConvertAnyToEncoded
        }
    }
}
