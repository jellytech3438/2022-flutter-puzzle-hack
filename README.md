# 2022 flutter puzzle hack

This project is called chesslide puzzle and is made for the flutter hackton.

Belows are About the project
(because markdown seems not support dart currently,so the code block
language is going to be java)

## Inspiration

This project is inspired by a slide puzzle called "Klotski".
At the first, i don't know how to make my slide puzzle game unique, but i remind that
i have played this kind of puzzle when i was a child. So i try to put another game "chess" into 
my game.

## How we built it

This project was build with flutter, and the hosting of web is firebase.

## Challenges we ran into

The biggest challenge in this project is the move of the King.
Since the King's size is 2x2 on the board, so i have to check every possible movement and then
make sure the swap function won't cause error(like sudden appear a chess or one of the King corner
is eaten). This really spent me a lot of time to debug and checking.

## Accomplishments that we're proud of

I think the best part in this project is the design of the levels.
Im not very famillier to the game design, so i try to go to the library and borrow some
"Game Design" book to read. After reading these books, the most important thing is to make 
player have a good experience. So i try my best to make every level looks simple but a little challenge.
That's what im proud of.

## What we learned

I'm very happy to found that i learn many things during building this project.

First, the BLoC, really spent me a lot of time learning it.Even thought there might 
still some places i didnot code well.I still have found it useful for many aspects.

Second, the Rive animation. This is my first time making animation, and the time i learning Rive is interesting.
Alse, i'm very surprised that making animation is much like programming. I think ill still playing with Rive in the future.

## What's next for Chesslide puzzle

In the game aspect, i can add many new function of block in the game.
Such like, teleport block, transform other piece block, and so on.

In other aspect,  i'll make a handout of my steps building this project, this book will contains 30 chapter, which
means 30 days of developing.As for the tool, i think i'll use mdbook(a rust package to write in markdown) to build it.