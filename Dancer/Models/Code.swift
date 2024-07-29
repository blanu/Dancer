//
//  Code.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/28/24.
//

import Foundation
import SwiftUI

public typealias Code = [Signal]

public class CodeContainer: Observable, ObservableObject
{
    @Published public var code: Code

    public init(code: Code)
    {
        self.code = code
    }
}

public class CodeIdentifier
{
    public let code: Code

    public init(code: Code)
    {
        self.code = code
    }
}

public enum Sign
{
    case character(String)
    case prosign(Prosign)
}

extension Sign: Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        switch self
        {
            case .character(let character):
                hasher.combine(character)

            case .prosign(let prosign):
                hasher.combine(prosign)
        }
    }
}

extension Sign: Equatable
{
    public static func == (lhs: Sign, rhs: Sign) -> Bool
    {
        switch lhs
        {
            case .character(let lcharacter):
                switch rhs
                {
                    case .character(let rcharacter):
                        return lcharacter == rcharacter

                    default:
                        return false
                }

            case .prosign(let lprosign):
                switch rhs
                {
                    case .prosign(let rprosign):
                        return lprosign == rprosign

                    default:
                        return false
                }
        }
    }
}

public let encodings = CodeDictionary(left: [
    [dah]: Sign.character("t"),
    [dah, dah]: Sign.character("m"),
    [dah, dah, dah]: Sign.character("o"),
    [dah, dah, di]: Sign.character("g"),
    [dah, dah, di, dah]: Sign.character("q"),
    [dah, dah, di, di]: Sign.character("z"),
    [dah, di]: Sign.character("n"),
    [dah, di, dah]: Sign.character("k"),
    [dah, di, dah, di]: Sign.character("c"),
    [dah, di, di]: Sign.character("d"),
    [dah, di, di, di]: Sign.character("b"),
    [dah, di, di, dah]: Sign.character("x"),
    [dah, di, dah, dah]: Sign.character("y"),

    [di]: Sign.character("e"),
    [di, dah, dah]: Sign.character("w"),
    [di, dah, di]: Sign.character("r"),
    [di, di]: Sign.character("i"),
    [di, dah]: Sign.character("a"),
    [di, di, dah, di]: Sign.character("f"),
    [di, di, di, di]: Sign.character("h"),
    [di, dah, dah, dah]: Sign.character("j"),
    [di, dah, di, di]: Sign.character("l"),
    [di, dah, dah, di]: Sign.character("p"),
    [di, di, di]: Sign.character("s"),
    [di, di, dah]: Sign.character("u"),
    [di, di, di, dah]: Sign.character("v"),

//    [di, dah, dah, dah, dah]: Sign.character("1"),
//    [di, di, dah, dah, dah]: Sign.character("2"),
//    [di, di, di, dah, dah]: Sign.character("3"),
//    [di, di, di, di, dah]: Sign.character("4"),
//    [di, di, di, di, di]: Sign.character("5"),
//    [dah, di, di, di, di]: Sign.character("6"),
//    [dah, dah, di, di, di]: Sign.character("7"),
//    [dah, dah, dah, di, di]: Sign.character("8"),
//    [dah, dah, dah, dah, di]: Sign.character("9"),
//    [dah, dah, dah, dah, dah]: Sign.character("0"),
//
//    [di, dah, di, dah, di, dah]: Sign.character("."),
//    [dah, dah, di, di, dah, dah]: Sign.character(","),
//    [di, di, dah, dah, di, di]: Sign.character("?"),
//    [di, dah, dah, dah, dah, di]: Sign.character("'"),
//    [dah, di, di, dah, di]: Sign.character("/"),
//    [dah, di, dah, dah, di]: Sign.character("("),
//    [dah, di, dah, dah, di, dah]: Sign.character(")"),
//    [dah, dah, dah, di, di, di]: Sign.character(":"),
//    [dah, di, di, di, dah]: Sign.character("="),
//    [di, dah, di, dah, di]: Sign.character("+"),
//    [dah, di, di, di, di, dah]: Sign.character("-"),
//    [di, dah, di, di, dah, di]: Sign.character("\""),
//    [di, dah, dah, di, dah, di]: Sign.character("@"),
])
