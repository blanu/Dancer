//
//  CodeTreeView.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/28/24.
//

import SwiftUI

struct CodeTreeView: View
{
    @EnvironmentObject private var codeContainer: CodeContainer

    public let codeTree: CodeTree
    public let left: Bool

    var body: some View
    {
        if self.codeTree.code.count % 2 == 0
        {
            VStack
            {
                if self.left
                {
                    SignView(sign: codeTree.sign)
//                    .padding([.top], -4)
                    .padding([.bottom], 4)
                    .underline(codeContainer.code == codeTree.code)
                    .bold(codeContainer.code == codeTree.code)
                    .frame(maxWidth: .infinity)
                }

                HStack
                {
                    if let leftChild = codeTree.leftChild
                    {
                        CodeTreeView(codeTree: leftChild, left: true)
                    }


                    if codeTree.leftChild != nil || codeTree.rightChild != nil
                    {
                        Divider()
                            .border(.tertiary, width: 1)
                    }

                    if let rightChild = codeTree.rightChild
                    {
                        CodeTreeView(codeTree: rightChild, left: false)
                    }
                }
                .padding([.horizontal], 4)
                .fixedSize()

                if !self.left
                {
                    SignView(sign: codeTree.sign)
                    .padding([.top], 4)
//                    .padding([.bottom], -4)
                    .underline(codeContainer.code == codeTree.code)
                    .bold(codeContainer.code == codeTree.code)
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(4)
            .border(Color.secondary, width: codeContainer.code == codeTree.code ? 1 : 0)
        }
        else
        {
            HStack
            {
                if !self.left
                {
                    SignView(sign: codeTree.sign)
                        .padding([.top], 4)
//                        .padding([.bottom], -4)
                        .underline(codeContainer.code == codeTree.code)
                        .bold(codeContainer.code == codeTree.code)
                        .frame(maxWidth: .infinity)
                }

                VStack
                {
                    if let leftChild = codeTree.leftChild
                    {
                        CodeTreeView(codeTree: leftChild, left: false)
                    }

                    if codeTree.leftChild != nil || codeTree.rightChild != nil
                    {
                        Divider()
                        .border(.tertiary, width: 1)
                    }

                    if let rightChild = codeTree.rightChild
                    {
                        CodeTreeView(codeTree: rightChild, left: true)
                    }
                }
                .padding([.horizontal], 4)
                .fixedSize()

                if self.left
                {
                    SignView(sign: codeTree.sign)
                    .padding([.top], 4)
//                    .padding([.bottom], -4)
                    .underline(codeContainer.code == codeTree.code)
                    .bold(codeContainer.code == codeTree.code)
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(4)
            .border(Color.secondary, width: codeContainer.code == codeTree.code ? 1 : 0)
        }
    }
}

#Preview
{
    CodeTreeView(codeTree: CodeTree(dictionary: encodings, code: [di], sign: .character("e")), left: true)
}
