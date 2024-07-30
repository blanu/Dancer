//
//  ViewSettings.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/29/24.
//

import Foundation
import SwiftUI

public class ViewSettings: ObservableObject, Observable
{
    @Published public var showKeybindings: Bool
    @Published public var showCodeTree: Bool

    public init()
    {
        self.showKeybindings = true
        self.showCodeTree = true
    }
}
