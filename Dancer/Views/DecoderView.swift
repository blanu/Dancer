//
//  ContentView.swift
//  Dancer
//
//  Created by Dr. Brandon Wiley on 7/27/24.
//

import SwiftUI


struct DecoderView: View
{
    static let fillDepth = 5

    @FocusState private var focused: Bool
    @State private var message: String = ""
    @State private var code: Code = []
    @EnvironmentObject private var viewSettings: ViewSettings

    private var container: CodeContainer = CodeContainer(code: [])

    let leftCodeTree: CodeTree = CodeTree(dictionary: encodings, code: [dah], sign: .character("t"), fillDepth: DecoderView.fillDepth)
    let rightCodeTree: CodeTree = CodeTree(dictionary: encodings, code: [di], sign: .character("e"), fillDepth: DecoderView.fillDepth)

    var body: some View
    {
        VStack
        {
            HStack
            {
                VStack
                {
                    if viewSettings.showKeybindings
                    {
                        Text("D/J")
                        .foregroundStyle(.primary)
                    }

                    if viewSettings.showCodeTree
                    {
                        CodeTreeView(codeTree: leftCodeTree, left: true)
                    }
                }

                VStack
                {
                    if viewSettings.showKeybindings
                    {
                        Text("S/L")
                        .foregroundStyle(.primary)
                    }

                    HStack
                    {
                        Divider()
                        .border(.black, width: 1)
                    }
                }

                VStack
                {
                    if viewSettings.showKeybindings
                    {
                        Text("F/K")
                        .foregroundStyle(.primary)
                    }

                    if viewSettings.showCodeTree
                    {
                        CodeTreeView(codeTree: rightCodeTree, left: false)
                    }
                }
            }

            CodeView(code: self.code)

            Text(message)
            .focusable()
            .focused($focused)
            .onKeyPress(.escape)
            {
                self.code = []
                self.container.code = []

                return .handled
            }
            .onKeyPress(.return)
            {
                print(message)

                code = []
                container.code = []
                message = ""

                return .handled
            }
            .onKeyPress(action: handleKeyPress)
            .onAppear
            {
                focused = true
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .environment(container)
    }

    func handleKeyPress(press: KeyPress) -> KeyPress.Result
    {
        switch press.characters
        {
            case "d":
                self.pressDah()
                return .handled

            case "j":
                self.pressDah()
                return .handled

            case "f":
                self.pressDi()
                return .handled

            case "k":
                self.pressDi()
                return .handled

            case "s":
                self.pressStop()
                return .handled

            case "l":
                self.pressStop()
                return .handled

            case " ":
                self.pressSpace()
                return .handled

            case "\u{7F}":
                print("DEL")

                if self.message.isEmpty
                {
                    return .handled
                }

                self.message = String(self.message.dropLast())

                return .handled

            default:
                print("Uknown key \(press.key) \(KeyPress.self))")
                return .ignored
        }
    }

    func pressDi()
    {
        self.pressSignal(di)
    }

    func pressDah()
    {
        self.pressSignal(dah)
    }

    func pressSignal(_ signal: Signal)
    {
        var newCode = code
        newCode.append(signal)

        if encodings.left[newCode] != nil
        {
            // With the new signal, it's still a valid code.

            code.append(signal)
            container.code.append(signal)

            var leftCode = code
            leftCode.append(di)

            if encodings.left[leftCode] == nil
            {
                // Adding a di would yield and invalid code.

                var rightCode = code
                rightCode.append(dah)

                if encodings.left[rightCode] == nil
                {
                    // Adding a dah would also yield an invalid code.
                    // Use the old code instead.

                    self.pressStop()
                }
            }
        }
        else
        {
            // With the new signal, it would no longer be a valid code.

            self.pressStop()
        }
    }

    func pressStop()
    {
        if let sign = encodings.left[code]
        {
            switch sign
            {
                case .character(let character):
                    message.append(character)

                case .prosign(let prosign):
                    message.append(prosign.prosign)
            }
        }

        code = []
        container.code = []
    }

    func pressSpace()
    {
        self.pressStop()

        message.append(" ")
    }
}

#Preview
{
    DecoderView()
}
