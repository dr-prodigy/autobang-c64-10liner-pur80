# autobang-c64-10liner-pur80

        ****  AUTOBANG!  BY  DR.P  2021  ****    
           
    C64  -  BASIC  10  LINER  CONTEST  -  PUR80  
    
    READY.
    
**Autobang!** is a pretty classic and old-school home computer BASIC game for Commodore 64 BASIC v2, written in 10 lines, 80 chars per line max.

It features some very basic (that's C=64 BASIC in fact :-) ) graphics, sound and gameplay but, in its extreme simplicity, it aims to be fun and addictive.

Its name is a tribute both to:
 - *"Autobahn"* (masterpiece album by Kraftwerk, German band universally recognized as pioneer in electronic music, made by analog synthesizers: definitely not far from the Commodore SID chip sounds style, about to appear in a couple of years)
 - a toy car (*"AUTOBANG"*) I owned in my childhood (late '70s/beginning of '80s, ie: near-C=64 era), named like that for it featured support for a toy gun tiny explosive charge, which was triggered by a spring-loaded lever, released by a button on its nose, thus blowing up with a "bang!" when sent against a wall.

### Story & gameplay
You are a brave driver in a car with no brakes, running like crazy in a winding country track, trying to stay alive following the road turns and avoiding pines (?!?) in the middle of your way.
Your goal is to complete the whole track 10 times (stages), but it won't be easy: at every new stage the road gets a bit narrower and on higher levels you will also find more trees on your way.
Score increases at every move, depending on the current stage (higher levels => more points).
Your sporty car can turn fast.. will your reflexes be good enough to bring you to the end of the race? 

### In-game controls
Z = move left
X = move right

### Menu commands
Q = quit
Any other string = start race

###  Technical notes
The game works PRINTing the road with new lines at the bottom of the screen (thus triggering system scroll routine, pretty slow still working as needed), while drawing "sprites" (car and pines, made of simple chars as well) through video/color RAM POKEs, so to leave the cursor position always at the bottom of the screen, simplifying the code and reducing overhead.
Track structure is coded through DATA in pairs formatted as `[turn direction delta X], [length], ....`
All sound effects are handled by SID voice #1, initialized once and then reprogrammed on-the-fly between sawtooth (engine sound while racing) and noise (bang) waveform when needed. Closing the program "gracefully" with Q ensures the sound is silenced.

Game is compatible with all C=64 kernals (real/emulated), even with the first versions (color RAM is explicitly set).

(c) 2021 by M.Montel (dr-prodigy): [find me on github](https://github.com/dr-prodigy/)