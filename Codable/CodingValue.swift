// Codable
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

import Foundation

/// The key used with `NSCoder` objects.
private let codingKey = "codable"

/// Wraps arbitrary `Codable` types, bridging them to `NSCoding`.
///
/// `CodingValue` does not place a compile-time restriction on the types that it can wrap. Therefore, clients must take
/// care to avoid using `Encoded` types that are not compatible with `AnyObject` - for example, `struct` values. In
/// those cases, `nil` will be encoded, and a decoded value will not be the same as the value it was encoded from.
public final class CodingValue<Value: Codable>: NSObject, NSCoding
{
    // MARK: - Initialization
    
    /**
    Initializes a coding value wrapper.
    
    - parameter value: The `Codable` value to wrap.
    */
    public init(_ value: Value?)
    {
        self.value = value
    }
    
    // MARK: - Properties
    
    /// The wrapped `Codable` value.
    ///
    /// The value of this property may be `nil`. This can occur if the value does not exist in a coder object, the value
    /// exists in the coder object, but cannot be decoded, or if the value is initialized with a `nil` value.
    public let value: Value?
    
    // MARK: - NSCoding
    
    /**
    Initializes the value with a coder object.
    
    - parameter coder: The coder object.
    
    - returns: A coding value. This initializer will not fail, but it may return a `CodingValue` with a `nil` `value`.
    */
    public init?(coder: NSCoder)
    {
        value = (coder.decodeObjectForKey(codingKey) as? Value.Encoded)
            .flatMap({ encoded in
                try? Value.decode(encoded)
            })
    }
    
    /**
     Encodes the value with a coder object.
     
     If the encoded type cannot be converted to `AnyObject`
     
     - parameter coder: The coder object.
     */
    public func encodeWithCoder(coder: NSCoder)
    {
        coder.encodeObject(value?.encode() as? AnyObject, forKey: codingKey)
    }
}
