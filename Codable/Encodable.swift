// Codable
// Written in 2015 by Nate Stedman <nate@natestedman.com>
//
// To the extent possible under law, the author(s) have dedicated all copyright and
// related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication along with
// this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

// MARK: - Encodable

/// A protocol that data structures can use to encode themselves.
public protocol Encodable
{
    /// The type that the data structure encodes to.
    typealias Encoded
    
    /// Encodes a value to the encoded type.
    func encode() -> Encoded
}
