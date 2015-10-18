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

// MARK: - AnyObject
public extension Encodable where Encoded: AnyObject
{
    /**
    Decodes from JSON data, if possible.
    
    - parameter data: The data to decode from.
    
    - throws: `EncodableError.CouldNotConvertAnyToEncoded`, or any `NSJSONSerialization` error.
    */
    public static func decodeJSONData(data: NSData) throws -> Self
    {
        return try decodeAny(try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()))
    }
    
    /**
    Encodes the data structure as JSON, if possible.
    
    - parameter options: The JSON writing options to use. By default, no options are enabled.
    
    - throws: Any `NSJSONSerialization` error.
    */
    public func encodeJSONData(options: NSJSONWritingOptions = NSJSONWritingOptions()) throws -> NSData
    {
        return try NSJSONSerialization.dataWithJSONObject(encode(), options: options)
    }
}

// MARK: - Array
public extension Encodable where Encoded == [AnyObject]
{
    /**
    Decodes from JSON data, if possible.
    
    - parameter data: The data to decode from.
    
    - throws: `EncodableError.CouldNotConvertAnyToEncoded`, or any `NSJSONSerialization` error.
    */
    public static func decodeJSONData(data: NSData) throws -> Self
    {
        return try decodeAny(try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()))
    }
    
    /**
    Encodes the data structure as JSON, if possible.
    
    - parameter options: The JSON writing options to use. By default, no options are enabled.
    
    - throws: Any `NSJSONSerialization` error.
    */
    public func encodeJSONData(options: NSJSONWritingOptions = NSJSONWritingOptions()) throws -> NSData
    {
        return try NSJSONSerialization.dataWithJSONObject(encode(), options: options)
    }
}

// MARK: - Dictionary
public extension Encodable where Encoded == [String:AnyObject]
{
    /**
    Decodes from JSON data, if possible.
    
    - parameter data: The data to decode from.
    
    - throws: `EncodableError.CouldNotConvertAnyToEncoded`, or any `NSJSONSerialization` error.
    */
    public static func decodeJSONData(data: NSData) throws -> Self
    {
        return try decodeAny(try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()))
    }
    
    /**
    Encodes the data structure as JSON, if possible.
    
    - parameter options: The JSON writing options to use. By default, no options are enabled.
    
    - throws: Any `NSJSONSerialization` error.
    */
    public func encodeJSONData(options: NSJSONWritingOptions = NSJSONWritingOptions()) throws -> NSData
    {
        return try NSJSONSerialization.dataWithJSONObject(encode(), options: options)
    }
}
