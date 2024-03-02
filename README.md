# DUBstep Dark theme

A dark theme for Dubstep forked from Sombre theme


This theme is freely redistributable under the terms of the GPLv3 License.

Author Bertrand Dekoninck 2021.
Version : 0.2


## Installation

Just compile the Dubstep theme with : 

```
gmake && ./theme-install.sh
``` 

The theme uses NSMacintoshInterfaceStyle (global menubar) by defaults.
The menubar is transparent (if used with a compositing manager as compton) because I wrote Dubstep to be used with a persistent menubar at the top the screen : TopBar (gnustep menus disappear when no gnustep app has the focus, but TopBar will stay). You can find TopBar at : https://github.com/BertrandDekoninck/TopBar.

If you don't want to use macmenus, ou can force the use of Next menus with :

defaults write NSGlobalDomain NSMenuInterfaceStyle NSNextStepInterfaceStyle

Or you can force the use of inwindow menus with :

defaults write NSGlobalDomain NSMenuInterfaceStyle NSWindows95InterfaceStyle

## Reference Material

C/O GNUstep github pages. Check the Method Summary section towards the bottom
https://gnustep.github.io/resources/documentation/Developer/Gui/Additions/GSTheme.html

