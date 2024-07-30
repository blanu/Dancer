//
//  CodeTree.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/28/24.
//

import Foundation

public class CodeTree
{
    static public func findChildren(_ dictionary: CodeDictionary, _ startingPoint: Code, _ fillDepth: Int) -> (CodeTree?, CodeTree?)
    {
        var leftChild: CodeTree? = nil
        var rightChild: CodeTree? = nil

        let leftCode = Code(startingPoint + [dah])
        if let leftSign = dictionary.left[leftCode]
        {
            let (leftGrandChild, rightGrandChild) = CodeTree.findChildren(dictionary, leftCode, fillDepth)
            leftChild = CodeTree(code: leftCode, sign: leftSign, leftChild: leftGrandChild, rightChild: rightGrandChild)
        }
        else if leftCode.count < fillDepth
        {
            let (leftGrandChild, rightGrandChild) = CodeTree.findChildren(dictionary, leftCode, fillDepth)
            leftChild = CodeTree(code: leftCode, sign: .character("∅"), leftChild: leftGrandChild, rightChild: rightGrandChild)
        }

        let rightCode = Code(startingPoint + [di])
        if let rightSign = dictionary.left[rightCode]
        {
            let (leftGrandChild, rightGrandChild) = CodeTree.findChildren(dictionary, rightCode, fillDepth)
            rightChild = CodeTree(code: rightCode, sign: rightSign, leftChild: leftGrandChild, rightChild: rightGrandChild)
        }
        else if rightCode.count < fillDepth
        {
            let (leftGrandChild, rightGrandChild) = CodeTree.findChildren(dictionary, rightCode, fillDepth)
            rightChild = CodeTree(code: rightCode, sign: .character("∅"), leftChild: leftGrandChild, rightChild: rightGrandChild)
        }

        return (leftChild, rightChild)
    }

    public let code: Code
    public let sign: Sign

    public let leftChild: CodeTree?
    public let rightChild: CodeTree?

    public init(code: Code, sign: Sign, leftChild: CodeTree?, rightChild: CodeTree?)
    {
        self.code = code
        self.sign = sign
        self.leftChild = leftChild
        self.rightChild = rightChild
    }

    public init(dictionary: CodeDictionary, code: Code, sign: Sign, fillDepth: Int = 0)
    {
        self.code = code
        self.sign = sign

        let (leftChild, rightChild) = CodeTree.findChildren(dictionary, code, fillDepth)
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

extension CodeTree: Identifiable
{
    public var id: ObjectIdentifier
    {
        return ObjectIdentifier(CodeIdentifier(code: self.code))
    }
}

