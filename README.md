
# Autobang - Commodore 64 10 Liner PUR-80 game

        ****  AUTOBANG!  BY  DR.P  2021  ****    
           
    C64  -  BASIC  10  LINER  CONTEST  -  PUR80  
    
    READY.

![Autobang!](https://github.com/dr-prodigy/autobang-c64-10liner-pur80/blob/main/images/autobang.gif?raw=true)

**\*\* WARNING! CODE CONTAINS A LINE OF 81 CHARS: PLEASE READ "CODE STATS AND JOKES" FOR DETAILS \*\***
    
**Auto!(bang)** is an **old-school home computer game** for **Commodore 64 BASIC v2**. I developed this (very well known) gameplay back in my C64 days ('80-something) as my first complete game project, inspired by [Motor Mania](https://www.lemon64.com/?game_id=1723): after more than 30 (!) years, I come back to re-do it from scratch as my first PUR-80 10-liner for the [**"BASIC 10 Liner Contest 2021"**](https://gkanold.wixsite.com/homeputerium/rules2021).

Although it features a quite common gameplay, I aimed to obtain the best graphics, sound and UI I could squeeze in 800 chars, and the most possible fun and challenge.
I must admit that, although it quite naturally can't feature all possible "bells & whistles", I find it definitely more interesting in this new PUR-80 version.
Also, for sure it's been big fun for me to do it ^^

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

Before getting back to the attract screen, the **keyboard buffer is cleaned** to avoid an undesired new game start due to previous game still in the buffer.

The **game main loop** works by **PRINTing the road** through **semi-graphic lines** at the **bottom of the screen**, thus triggering **system scroll routine** (you can also "take a rest" keeping Ctrl down if you wish! But you won't be able to turn meanwhile, so no big cheating..), while **drawing trees** at random positions through **video RAM POKEs**.
This allows to create **trees of 2 chars** while still scrolling 1 line at a time. 
Trees are randomically added to the track at each row, and their number depends on the level (L1-L5 => 1, L6-L8 => 2, L9+ => 3).
They can appear out of the road too. This has not only aesthetic purposes, but also provides more difficulty balance. 

The **car is rendered with VIC sprite #0**, initialized in code as a long vertical "stick" 6 pixels wide, partially hidden in the highest part of the screen to look more like a car than a bus :-)
It can move in steps of 8 pixels for each printed row (ie: following the char grid), so it's capable of 45° turns.
In case of a crash, car sprite pointer is changed to an uninitialized memory area, good enough to mimic a "destroyed" effect.

**Track DATA** are structured in **sectors**, represented by **int pairs** (format: *`[turn direction X], [sector length Y)], ....`*).
Due to the C64 BASIC default array size (10 elements), track sectors are limited to a number of 10.
Track is initially 20 chars wide, and then it's narrowed by 1 char for each new level. 

All **sound effects** are handled by **SID voice #1**, initialized once and then reprogrammed on-the-fly between sawtooth and noise waveform when needed.

The game ends up with a **"GAME OVER"** (crash sound) or a **"GOAL!"** (whistle sound) message, along with the final score.
Sounds duration and sprite initializations (run every time on purpose) give enough time to the player to read his score before the attract screen comes back in.

The game code is designed to **work flawlessly on any C64 version** (ie: from R1 KERNAL on), real or emulated, in that it includes explicit color POKEs for all drawn characters (thus circumventing older versions' video color RAM bug).

Auto!(bang) has been developed using [C64 Studio](https://www.c64-wiki.com/wiki/C64_Studio): big kudos to Georg Rottensteiner for his great work!

#### Code stats & Jokes
The program is made of **10 lines (0-9)**, for an exact **total of 800 chars** if counting the 81st char (see below!) in line 6, or otherwise 799 for the "legit" version of the code (ie: with that char removed).

Code is signed with **my initials ("DRP")** at the end of lines 3-6:
* "D" (line 3) is part of the program code
* "R" (line 5) is in a **syntax error block of code** which, due to the previous `...THEN7:`, is however never parsed, thus unharmful
* "P" (line 6) is the **81st (!!!) char**, so it **would theoretically infringe PUR-80 rules** but, although meaningful and correct from the program point of view, **is unnecessary** (relevant NEXT statement works perfectly without it) and can be removed easily, also editing on a real C64: it's there to complete my initials, and as a little joke, in fact :-)

![drp](https://github.com/dr-prodigy/autobang-c64-10liner-pur80/blob/main/images/autobang_drp.png?raw=true)

#### Variables
**All variable names are 1 char long** to save space. **S** and **V** are used to access **SID** and **VIC II** registers with shorter code (like it used to be in the good ol' days). Here is a complete list:

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
Thanks for this nice contest.. enjoy Auto!(bang), your C64, and life!
Cheers

*dr.p*


**(c) 2021 by Maurizio Montel (dr.prodigy)**: [find me on github](https://github.com/dr-prodigy/)
