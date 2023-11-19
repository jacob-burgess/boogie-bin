# boogie bin

collection of little scripts to make my life easier

this all started when i was setting up my new computer and was fudgin around with .zshrc and $PATHs and what not and i kept forgetting how to pretty-print my path... i must have googled it 10 times. Finally i decided i was going to write a [script to do it for me](./cmd/path). Then i thought, "hey, i could write a script for all the things i google all the time." So I added the python venv stuff b/c i hate having to remember those ones

I plan to add stuff i find myself forgetting. if there are suggestions, bang my boogie line.

but i have no clue how to write code in bash, so idk why i did that. kinda fun tho.

This is probably not the right way to do this kind of thing but its working, so im doing it.

![boogie](./assets/example.gif)

## to use this

First of all, you probably dont want to use this. Its not really meant for anyone else to use. But if you do, here's how:

1. clone this repo into your /Documents folder
   - You dont really want it in your normal places you put code becuase we'll be adding it to your path and that just feels funny to me. it does really matter, its just an icky feeling
2. add the directory to your path
   - `cd && nano .zshrc`
   - add `export PATH=$PATH:/Users/<your_username>/Documents/boogie-bin` to the end of the file
   - save and close (ctrl+o, ENTER, ctrl+x)
3. restart your terminal
4. run `boogie` to confirm it works

## adding a new script

1. create a file without a file extenstion in the `/cmd` directory. The file name will be the cli command. e.g. a file named `picker` will be run with `boogie picker`
2. Decide which runtime you want to write the script and determine its filepath
   - run `which node`, `which bash`, etc. to get its filepath
3. begin your script file with `#! <filepath_for_runtime>`, e.g. `#! /bin/bash`
4. write your script
5. `chmod +x <filename>`
6. maybe have to restart the terminal, idfk
7. test it out from anywhere in your terminal with `boogie <filename>`

## make it your own

I made this for me (boogie), but if you want to de-boogify, this section is for you.

### basic idea

The fact that `boogie-bin` is now in your path, any script you place in the root directory can be run directly from the command line. For example, you can add a script called `dingdong` to the root of your `boogie-bin` directory and run it simply by typing `dingdong` into your terminal.

### de-boogify

1. change the name of [boogie](./boogie) to something else, and you can run it with that name.
2. If you want to change the name of the directory to something other than `boogie-bin`, you can do that too. Just make sure you update the path in your .zshrc file.
3. Get yourself some ascii art to replace the boogie one in the [utilities.sh file](./scripts/utilities.sh). I used [patorjk.com](http://patorjk.com/software/taag/) s/o to [this guy](https://github.com/patorjk)

I think that's all the boogies. Theres proabably more, but those are the big ones - you can go digging for your own boogies.
