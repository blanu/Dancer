//
//  Signal.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/28/24.
//

import Foundation

public let di = Signal.di
public let dah = Signal.dah

public enum Signal
{
    case di
    case dah
}

public class SignalIdentifier
{
    public let signal: Signal

    public init(signal: Signal)
    {
        self.signal = signal
    }
}

extension Signal: Identifiable
{
    public var id: ObjectIdentifier
    {
        return ObjectIdentifier(SignalIdentifier(signal: self))
    }
}
