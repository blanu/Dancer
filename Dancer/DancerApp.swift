//
//  DancerApp.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/27/24.
//

import SwiftUI

@main
struct DancerApp: App
{
    @ObservedObject var viewSettings: ViewSettings = ViewSettings()

    var body: some Scene
    {
        WindowGroup
        {
            DecoderView()
            .environment(viewSettings)
        }
        .windowResizability(.contentMinSize)
        .commands
        {
            ViewMenu(showKeybindings: $viewSettings.showKeybindings, showCodeTree: $viewSettings.showCodeTree)
        }
    }
}
