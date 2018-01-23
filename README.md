# iosSpeechSynth
iOS Speech Synthesis Demo

This is a quick demo I through together to play with the iOS speech synthesis libraries. 

It was written entirely in Swift Playgrounds 2.0 (build 7.40.8, beta 6)

After running the playground, tap into the textbox at the bottom of the live view and type in a question.  The super-rudimentary Question Answering AI will attempt to recognize your question and then respond in both text and voice.  You can see a list of the questions it can recognize by examining the code.  For reasons I didn't bother to dig into, it's not going to recognize anything with an apostraphe in it, so just skip those when typing.

The important part of the demo is in the speak() function, which shows converting a string into a voice that's output from the device speakers (as long as the volume is up).
