//
//  Prosigns.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/28/24.
//

import Foundation

public struct Prosign: Equatable
{
    public let prosign: String
    public let character: Code
    public let meaning: String

    public init(prosign: String, character: Code, meaning: String)
    {
        self.prosign = prosign
        self.character = character
        self.meaning = meaning
    }
}

extension Prosign: Hashable
{
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(prosign)
    }
}

public struct Prosigns
{
    public let AA = Prosign(prosign: "A\u{FE26}A\u{FE26}", character: [di, dah, di, dah], meaning: "Start new line.")
    public let AR = Prosign(prosign: "A\u{FE26}R\u{FE26}", character: [di, dah, di, dah, di], meaning: "Start new message.")
    public let AS = Prosign(prosign: "A\u{FE26}S\u{FE26}", character: [di, dah, di, di, di], meaning: "Wait.")
    public let BT = Prosign(prosign: "B\u{FE26}T\u{FE26}", character: [dah, di, di, di, dah], meaning: "New paragraph.")
    public let CT = Prosign(prosign: "C\u{FE26}T\u{FE26}", character: [dah, di, dah, di, dah], meaning: "Start of transmission.")
    public let HH = Prosign(prosign: "H\u{FE26}H\u{FE26}", character: [di, di, di, di, di, di, di, di], meaning: "Correction.")
    public let K = Prosign(prosign: "K", character: [dah, di, dah], meaning: "Invitation for any station to transmit.")
    public let X = Prosign(prosign: "X", character: [dah, di, di, dah], meaning: "Full stop.")
    public let QM = Prosign(prosign: "?", character: [di, di, dah, dah, di, di], meaning: "Please say again.")
    public let KN = Prosign(prosign: "K\u{FE26}N\u{FE26}", character: [dah, di, dah, dah, di], meaning: "Invitation for named station to transmit.")
    public let NJ = Prosign(prosign: "N\u{FE26}J\u{FE26}", character: [dah, di, di, dah, dah, dah], meaning: "Shift to Wabun code.")
    public let SK = Prosign(prosign: "S\u{FE26}K\u{FE26}", character: [di, di, di, dah, di, dah], meaning: "End of contact.")
    public let SN = Prosign(prosign: "S\u{FE26}N\u{FE26}", character: [di, di, di, dah, di], meaning: "Understood.")
    public let SOS = Prosign(prosign: "S\u{FE26}O\u{FE26}S\u{FE26}", character: [di, di, di, dah, dah, dah, di, di, di], meaning: "Start of distress signal.")
    public let DDD = Prosign(prosign: "D\u{FE26}D\u{FE26}D\u{FE26}", character: [dah, di, di, dah, di, di, dah, di, di], meaning: "Start of a distress signal relayed from another station.")
    public let BK = Prosign(prosign: "B\u{FE26}K\u{FE26}", character: [dah, di, di, di, dah, di, dah], meaning: "Break in conversation.")
    public let CL = Prosign(prosign: "C\u{FE26}L\u{FE26}", character: [dah, di, dah, di, di, dah, di, di], meaning: "Closing down.")
}
