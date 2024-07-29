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
    var body: some Scene
    {
        WindowGroup
        {
            DecoderView()
        }
        .windowResizability(.contentSize)
    }
}
