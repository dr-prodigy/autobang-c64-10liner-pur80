# autobang-c64-10liner-pur80

        ****  AUTOBANG!  BY  DR.P  2021  ****    
           
    C64  -  BASIC  10  LINER  CONTEST  -  PUR80  
    
    READY.
    
**Autobang!** is a pretty classic and old-school home computer BASIC game for Commodore 64 BASIC v2. I developed this game back in the C64 days as a complete game: after more than 30 years(!!!), I decided to re-implement it as 10-liner.

It features some very basic (that's C=64 BASIC after all ^^) graphics, sound and gameplay but, in its extreme simplicity/naiveness, it is engineered to be fun and addictive.

Its name is a tribute both to:
 - *"Autobahn"* (masterpiece album by Kraftwerk, German band universally recognized as pioneer in electronic music, made by analog synthesizers: definitely not far from the Commodore SID chip sounds style, about to appear in a couple of years)
 - a toy car (*"AUTOBANG"*) I owned in my childhood (late '70s/beginning of '80s, ie: near-C=64 era), named like that for it featured support for a toy gun tiny explosive charge, which was triggered by a bumper on its nose, thus blowing up with a "bang!" when sent against a wall.

### Story & gameplay
You are a brave driver in a car with no brakes, running like crazy in a winding country road and trying to stay alive while following the road turns and avoiding pines grown in the middle of the road (?!?).

Your goal is to complete the whole track 10 times (stages), but it won't be that easy: at every new stage the road gets a bit narrower and on higher levels you will also find more trees on your way.

The game ends either you hit road borders / a tree, or you reach the goal.

Score increases while you proceed in your crazy run, depending on the current stage (higher levels => more points).

Your sporty car can turn fast.. will your reflexes be as good, enough to bring you to the end of the race? 

### Instructions to play the game
- Open WinVice (C64)
- Select "File" -> "Autostart disk image..."
- Attach "autobang.prg" file

### In-game controls
Z = move left

M = move right

### Attract mode commands
Q = quit

Any other string = start a new race

###  Technical notes
Along with the game itself, the code features a brief attract screen, explaining the commands, while allowing to exit the program gracefully without STOP (Q command).

The game works PRINTing the road through semi-graphic lines at the bottom of the screen (thus triggering system scroll routine: pretty slow and prone to some "cheating" if keeping Ctrl key down, yet working..), while drawing "sprites" (car and pines, made of simple chars as well) through video RAM POKEs, so to leave the cursor position always at the bottom of the screen, thus simplifying the code and reducing overhead.

Track structure is coded in sectors through DATA value pairs (format: `[turn direction x], [sector length y)], ....`), scattered throughout the code (even after IF/THEN constructs, which don't interfere with their accessibility).
Due to the C64 BASIC default array size (10 elements), track sectors are limited to a number of 10.
Just adding DIM X(xx),Y(xx) and more DATA lines could let the track become longer as desired.

Due to the code length limit, the car has been rendered with 2 "U" chars, so it flickers when the screen scrolls. With a couple of changes (not squeezable there) it could instead be a sprite, thus removing any flickering. Collisions are based on video RAM status, so those would work as-is. 

Trees can sometimes appear out of the road too. This is done not only for aesthetical purposes, but also to provide more difficulty balance. 

All sound effects are handled by SID voice #1, initialized once and then reprogrammed on-the-fly between sawtooth (engine sound while racing) and noise (bang) waveform when needed. Closing the program "gracefully" with Q command ensures the sound is silenced before leaving.

The game is 100% compatible with R3 KERNALs (ie: featuring video color RAM fix) only, but
it works with all older C=64 versions too with just some glitches (on R1 trees trunks are white, while on R2 aren't visible). This said, the game is totally playable on any machine anyway.

#### Variables

All variable names are 1 byte long to reduce fingerprint. S and V are used to point SID and VIC registers with shorter code (like it used to be in the good ol' days).

C = Car position (x)
E = scorE
D = no. of track sector Data (zero-based) (+Drp)
L = current Level
N = curreNt track sector
O = track row Offset (x)
P = temP iterator for trees and game over graph&sound effects (+drP)
Q = Quick temp variable to gain some bytes
R = current sector Row
S = SID first register location
T = Track current position (x)
V = VIC II location
W = track Width (recalculated at every row)
X(array) = track sector turn delta X (0=go straight; <0 = turn left; >0 = turn right)
Y(array) = track sector length Y

K$ = pressed Key (in game) / chosen command (attract mode)
R$ = game Result

(c) 2021 by M.Montel (dr-prodigy): [find me on github](https://github.com/dr-prodigy/)