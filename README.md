# Alien-Swarm-Macro-GUI
This tool for Alien Swarm works like this :

1) Make a GUI of 8 buttons in AHK (9 if you want to keep the center button as well) that works like the emote panel in Alien Swarm

By default, I made those 2 GUI, but there are more images to use for different GUI
![Emote GUI](https://i.imgur.com/DEEJIsx.png)
![Horde GUI](https://i.imgur.com/83e5E7p.png)

It works like the emote panel, so holding the hotkey will move your mouse to the center, then when you release the hotkey while your mouse is near an image, it will launch that specific macro

2) Create the Macros

By default, the buttons I use to make the macro are : Left Control, Right Control, Numpad [1-9]. Those are in the autoexec.cfg, so if you already have one, just copy paste the contents of this one into yours, and make sure Left Control, Right Control, Numpad [1-9] are not used.

The idea is to create 9 binds for the 9 numpad buttons, then use alias to transform those binds into different binds if you press left control for 9 extra macros (and same with right control for another 9 macros)

3) Customize the GUI

In the HotkeySetting.ini, you can choose the key (default is k)

Then, by default: 

- pressing k once => anime smiley emote
- pressing k twice => question mark emote
- holding down k => emote GUI
- pressing k twice then holding down k => horde GUI

Obviously, you can change those default setting, but for that you will have to download [AutoHotkey](https://www.autohotkey.com/).

Just edit the .ahk file with [Notepad++](https://notepad-plus-plus.org/downloads/). Macro and Wawakey functions (near the end of the script) are for the actions done (pressing once/twice/hold/hold after pressing).

LaunchOnslGUI and LaunchEmoteGUI (middle of the script) are for the actions done for each image (in horde/emote panel, respectively)

To change the images inside the GUI, it's at the start of the script, just change the path to change the image

![code path](https://i.imgur.com/4jUJnDy.png)

Just change "enemies\Parasite.png" to "emotes\emotego.png" for instance to turn the parasite image into the Go image (you will then need to change the action as well)

Once you understand the principle behind it, you can make custom GUI as well like this :

![Custom GUI](https://i.imgur.com/1bzQS5a.png)

4) Customize the Macros

By default, I made it so in the autoexec.cfg :

- Numpad [1-9] => Horde GUI macros
- Left Control + Numpad [1-9] => Character Selection (in lobby, this is some small bonus lol, but feel free to change that to new macros and use it for another GUI :p)
- Right Control + Numpad [1-9] => Emotes

At the end of the file, you can see this :

![Default Macros](https://i.imgur.com/BHYkttD.png)

The binds will cycle through the 4 texts, and by default it will be XENO1/XENO2/XENO3/XENO4, but you can change the text here to have some better macros :)
