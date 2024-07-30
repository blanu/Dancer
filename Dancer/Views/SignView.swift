//
//  SignView.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/28/24.
//

import SwiftUI

struct SignView: View
{
    let sign: Sign

    let font = Font.system(size: 12).monospaced()

    var body: some View
    {
        VStack
        {
            switch sign
            {
                case .character(let character):
                    Text(character)
                    .font(self.font)
                    .foregroundStyle(.primary)

                case .prosign(let prosign):
                    Text(prosign.prosign)
                    .font(self.font)
                    .foregroundStyle(.primary)
            }
        }
        .frame(minWidth: 10)
    }
}

#Preview
{
    SignView(sign: .character("a"))
}
