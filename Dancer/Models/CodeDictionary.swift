//
//  Isomorphism.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/28/24.
//

import Foundation

public class CodeDictionary
{
    static func invert(_ left: [Code: Sign]) -> [Sign: Code]
    {
        var result: [Sign: Code] = [:]

        for (key, value) in left
        {
            result[value] = key
        }

        return result
    }

    public let left: [Code: Sign]
    public let right: [Sign: Code]

    public init(left: [Code: Sign])
    {
        self.left = left
        self.right = CodeDictionary.invert(left)
    }
}
