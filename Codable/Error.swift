// Codable
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

// MARK: - Errors

/// Enumerates errors in the Codable framework.
public enum CodableError: Int, ErrorType
{
    /// Could not convert from `Any?` to the encoded type in `decodeAny(:)`.
    case CouldNotConvertAnyToEncoded
    
    /// Could not convert the encoded representation of the type to `AnyObject`.
    /// This can occur while using the JSON and property list extensions.
    case CouldNotConvertEncodedToAnyObject
    
    /// A Cocoa operation failed, but an error value was not provided.
    case UnknownCocoaError
    
    /// The error domain for Codable errors.
    public static let domain = "CodableErrorDomain"
    
    /// The error domain.
    public var _domain: String
    {
        return CodableError.domain
    }
    
    /// The error code.
    public var _code: Int
    {
        return self.rawValue
    }
}
