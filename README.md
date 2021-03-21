
# autobang-c64-10liner-pur80

        ****  AUTOBANG!  BY  DR.P  2021  ****    
           
    C64  -  BASIC  10  LINER  CONTEST  -  PUR80  
    
    READY.

![Autobang!](https://github.com/dr-prodigy/autobang-c64-10liner-pur80/blob/main/images/autobang.gif?raw=true)

**\*\* WARNING! CODE CONTAINS A LINE OF 81 CHARS: PLEASE READ "CODE STATS AND JOKES" FOR DETAILS \*\***
    
**Auto!(bang)** is an **old-school home computer game** for **Commodore 64 BASIC v2**. I developed this (very average) gameplay back in my C64 days ('80-something) as my first complete game project: after more than 30 (!!!) years, I come to re-implement it as my first PUR80 10-liner for the **"BASIC 10 Liner Contest 2021"** ( https://gkanold.wixsite.com/homeputerium/rules2021 ).

Although it features a very common gameplay, I aimed to obtain the best graphics, sound and UI I could squeeze in 800 chars, and the most possible fun and challenge.

Its name (shortened in "Auto!", where "!" is read "bang" as in the unix tradition) is a tribute both to:
 - *"Autobahn"* (masterpiece album by Kraftwerk, German band universally recognized as pioneer in electronic music, made by analog synthesizers: definitely not that far from the Commodore SID chip sound style!)
 - a toy car (*"AUTOBANG"*) I owned in my childhood (ie: near-C64 era), named like that for it featured support for a toy gun tiny explosive charge, which was triggered by a bumper on its nose, thus blowing up with a "bang!" when sent against a wall.

### Story & gameplay
You are **Bangy Boy**, a brave driver in a **car with no brakes**, running like crazy in a winding country road and trying to stay alive while **following road turns** and **avoiding pines** grown up in the middle of the road (?!?).

Your goal is to **complete the whole track 10 times** (*stages*), but it won't be that easy: at every new stage (greeted by a start banner with the stage # on it) the road gets a bit narrower and you will find more and **more trees** on your way.

The **game ends** when you **hit road borders / a tree**, or if you **complete the race**.

Score increases while you proceed in your crazy run, depending on the current stage (higher levels => more points).

***Your sporty car can turn fast.. will your reflexes and strategy be as good, enough to bring you to the end of the run?***

### Instructions to play the game
* Open WinVice (C64)
* Select *"File"* -> *"Autostart disk image..."*
* Attach *"autobang.prg"* file

### In-game controls
**Z** = Move left

**M** = Move right

### Attract mode controls
*Any key* = Start a new race

**RUN/STOP** = Quit

###  Technical notes
Along with the game itself, the code features a **tiny attract screen** with game name ("bang" is shortened in "!", as of unix standard conventions) **explaining the commands**, while allowing to exit the program with RUN/STOP with no SID oscillator active / no killer sound going (phewww!).

The **game main loop** works by **PRINTing the road** through **semi-graphic lines** at the **bottom of the screen**, thus triggering **system scroll routine** (you can also "take a rest" keeping Ctrl down if you wish! But you won't be able to turn meanwhile, so no big plus..), while **drawing trees** at random positions through **video RAM POKEs**.
This allows to create **trees of 2 chars** while still scrolling 1 line at a time. 
Trees are randomically positioned, and their per-row number depends on the level (L1-L5 => 1, L6-L8 => 2, L9+ => 3).
They can appear out of the road too. This has not only aesthetic purposes, but also provides more difficulty balance. 

The **car is rendered with VIC sprite #0**, initialized in code as a long vertical "stick" 6 pixels wide, partially hidden in its highest part to look more like a car than a bus :-)
It can move in steps of 8 pixels every printed row, so it's capable of 45° turns.
In case of a crash, sprite pointer is changed to an uninitialized memory area, sufficient to mimic a "destroyed" effect.

**Track DATA** are structured in **sectors**, represented by **int pairs** (format: *`[turn direction X], [sector length Y)], ....`*). Due to the C64 BASIC default array size (10 elements), track sectors are limited to a number of 10.
Track width is initially 20 chars, and then it's reduced by 1 char every new level. 

All **sound effects** are handled by **SID voice #1**, initialized once and then reprogrammed on-the-fly between sawtooth (engine infinite sound while racing) and noise (crash) waveform when needed.

The game ends up with a **"GAME OVER"** (crash sound) or a **"GOAL!"** (whistle sound) message, along with the final score.
Sounds duration and sprite initializations (run every time on purpose) give enough time to the player to read his score before the attract screen comes back in.

The game code is designed to **work flawlessly on any C=64 version** (ie: from R1 KERNAL on), real or emulated, in that it includes explicit color POKEs for all drawn characters (thus circumventing older versions' video color RAM bug).

#### Code stats & jokes
The program is made of **10 lines (0-9)**, for an exact **total of 800 chars** if counting the 81st char (see below!) of line 6, or otherwise 799 for the "legit" version of the code (ie: with that char removed).

Code is signed with **my initials ("DRP")** at the end of lines 3-6:
* "D" (line 3) is part of the program code
* "R" (line 5) is a **syntax error block of code** which, due to the previous `...THEN7:`, is however never parsed thus unharmful
* "P" (line 6) is the **81st (!!!) char**, so it **would theoretically infringe PUR80 rules** but, although meaningful and correct from the program point of view, **is unnecessary** (relevant NEXT statement works perfectly without it) and can be removed easily, also editing on a real C64: it's there only to complete my initials, and as a little joke :-)

#### Variables
**All variable names are 1 char long** to save space. **S** and **V** are used to access **SID** and **VIC II** registers with shorter code (like it used to be in the good ol' days). 

|**Name**|Description|
|--|--|
|**C**|Car position (x)|
|**D**|track sector Data index (zero-based)|
|**E**|ScorE|
|**I**|temp Iterator / variable to gain some bytes|
|**L**|current Level|
|**N**|curreNt track sector|
|**O**|track row Offset (x)|
|**P**|temP iterator for trees and game over graph&sound effects|
|**Q**|Quick temp variable to gain some bytes|
|**R**|current sector Row|
|**S**|SID first register location|
|**T**|Track current position (x)|
|**V**|VIC II first register location|
|**W**|track Width (recalculated at every row)|
|**X** (array)|track sector turn delta X (0=go straight; <0 = turn left; >0 = turn right)|
|**Y** (array)|track sector length Y|
|**K\$**|pressed Key (in game) / chosen command (attract mode)|
|**R\$**|game Result|

#### Conclusions
Thanks for this great contest.. enjoy Autobang!
*dr.prodigy*

**(c) 2021 by Maurizio Montel (dr.prodigy)**: [find me on github](https://github.com/dr-prodigy/)
