//
//  CodeView.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/28/24.
//

import SwiftUI

struct CodeView: View
{
    let code: Code

    var body: some View
    {
        HStack
        {
            ForEach(code)
            {
                signal in

                SignalView(signal: signal)
            }

            if code.isEmpty
            {
                Text(" ")
            }
        }
        .frame(minWidth: 5)
    }
}

#Preview {
    CodeView(code: [di, dah])
}
