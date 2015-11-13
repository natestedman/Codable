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

// MARK: - Decoding
public extension Decodable
{
    // MARK: - Property Lists
    
    /**
    Decodes from property list data, if possible.
    
    - parameter data: The property list data to decode from.
    
    - throws: `CodableError.CouldNotConvertAnyToEncoded`, or any `NSPropertyListSerialization` error.
    */
    public static func decodePropertyListData(data: NSData) throws -> Self
    {
        return try decodeAny(try NSPropertyListSerialization.propertyListWithData(
            data,
            options: NSPropertyListReadOptions(),
            format: nil
        ))
    }
    
    /**
    Decodes from a property stream, if possible.
    
    - parameter stream: The property list stream to decode from.
    
    - throws: `CodableError.CouldNotConvertAnyToEncoded`, or any `NSPropertyListSerialization` error.
    */
    public static func decodePropertyListStream(stream: NSInputStream) throws -> Self
    {
        return try decodeAny(try NSPropertyListSerialization.propertyListWithStream(
            stream,
            options: NSPropertyListReadOptions(),
            format: nil
        ))
    }
}

// MARK: - Encoding
public extension Encodable
{
    // MARK: - Property Lists
    
    /**
    Encodes the data structure as a property list, if possible.
    
    - parameter format: The property list format to use.
    
    - throws: `CodableError.CouldNotConvertEncodedToAnyObject`, or any `NSPropertyListSerialization` error.
    */
    public func encodePropertyListDataWithFormat(format: NSPropertyListFormat) throws -> NSData
    {
        if let anyObject = encode() as? AnyObject
        {
            return try NSPropertyListSerialization.dataWithPropertyList(anyObject, format: format, options: 0)
        }
        else
        {
            throw CodableError.CouldNotConvertEncodedToAnyObject
        }
    }
    
    /**
    Encodes the data structure as a property list, if possible.
    
    - parameter stream: The output stream to write to.
    - parameter format: The property list format to use.
    
    - throws: `CodableError.CouldNotConvertEncodedToAnyObject`, `CouldNotConvertEncodedToAnyObject.UnknownCocoaError,
               or any `NSPropertyListSerialization` error.
    */
    public func encodePropertyListDataToStream(stream: NSOutputStream, withFormat format: NSPropertyListFormat) throws -> Int
    {
        if let anyObject = encode() as? AnyObject
        {
            var error: NSError?
            
            let bytes = NSPropertyListSerialization.writePropertyList(
                anyObject,
                toStream: stream,
                format: format,
                options: 0,
                error: &error
            )
            
            if bytes == 0
            {
                throw error ?? CodableError.UnknownCocoaError
            }
            else
            {
                return bytes
            }
        }
        else
        {
            throw CodableError.CouldNotConvertEncodedToAnyObject
        }
    }
}
