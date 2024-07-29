#  Dancer

Dancer is a Morse code input experiment for macOS using the keyboard.

It has no dependencies and is written in Swift and SwiftUI.

## Usage

In Morse code, English letters are entered using a series of dots and dashes. Dancer uses the macOS keyboard to enter dots and dashes. It supports both left-handed and right-handed operation.

### Left-handed Usage

J - dot
K - dash
L - stop letter
Space - stop letter and move onto next word
Enter - clear message

### Right-handed Usage

D - dot
F - dash
S - stop letter
Space - stop letter and move onto next word
Enter - clear message

### User Interface

The application is driven entirely by keyboard input. At the top is a list of the key bindings.

In the center is a tree of the Morse code sequences to each letter. As you type in dots and dashes, the group of letters whose prefixes match the current Morse code sequence will be shown with a bounding box.
The letter that corresponds to the current sequence will be underlined.

There are multiple ways to stop entering a Morse code sequence and move onto the next letter:
- Press the stop key, S or L. This will stop the sequence and add the currently underlined letter to the message.
- Press the space key. This will stop the sequnce, add the currently underlined letter to the message, and add a space to the message.
- Add a dot or dash to the sequence such that there are no further valid sequences after it. This will automatically add the currently underlined character to the message.
- Add a dot or dash to the sequence such that the sequence is now invalid. This will back up to the previous sequence and add that character to the message.
- Press Enter. This will clear the current sequence and also clear the current message. This way you can start over writing a new message.

## Limitations

Currently this application only allows for Morse code practice. It does not have any way to send messages. You can clear the current message with Enter to start over.
Morse code is usually associated with the Continuous Wave (CW) radio mode, which has a very distinctive sound. Currently, there is no audio feedback when entering letters.
