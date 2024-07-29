//
//  SignalView.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/28/24.
//

import SwiftUI

struct SignalView: View
{
    let signal: Signal

    var body: some View
    {
        switch signal
        {
            case .di:
                Text("•")

            case .dah:
                Text("‒")
        }
    }
}

#Preview
{
    SignalView(signal: .di)
}
