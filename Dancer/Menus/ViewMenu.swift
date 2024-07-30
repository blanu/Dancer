//
//  ViewMenu.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/29/24.
//

import SwiftUI

struct ViewMenu: Commands
{
    @Binding var showKeybindings: Bool
    @Binding var showCodeTree: Bool

    var body: some Commands
    {
        CommandGroup(after: .sidebar)
        {
            Toggle(
                isOn: $showKeybindings,
                label:
                    {
                        Text("Show Keybindings")
                    }
            )

            Toggle(
                isOn: $showCodeTree,
                label:
                    {
                        Text("Show Code Tree")
                    }
            )
        }
    }
}
