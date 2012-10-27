README file for Hydrax 0.5.4 (by Jose Luis Cercós Pita & Naëm Baron)
Hydrax is an completely free add-on for Ogre which aim is to provide an easy-use library in order to render pretty water scenes. Written by Xavier Verguin, has contributed Jose Luis Cercós and Naëm Baron.

For current documentation please use Ogre Wiki:
Main project page:
http://www.ogre3d.org/tikiwiki/Hydrax

--- Linux users ---------------------------

You can use the makefile. Simply execute the commands

make clean
make -j4
make install

Depending your distribution, consider use PREFIX=/usr/local (default value is PREFIX=/usr)

make clean
make -j4 PREFIX=/usr/local
make install PREFIX=/usr/local

--- Linux developers ----------------------

Code::Blocks project has been provided, simply compile and use it. If you want to help the project, a git repository exist in gitorius.

http://gitorious.org/sonsilentsea/hydrax

Simply register on the web page, and send me a message.

--- Windows users -------------------------

* Code::Blocks & MinGW alternative.

If you use Code::Blocks & MinGW simply add MYGUI_LIB to the #define tab in the build options of Code::Blocks.

* Microsoft VS2010.

If you use Microsoft VS2010, a project has been provided by Naëm Baron (also found some bugs, thanks Naëm). Follow next releases notes:

| Hydrax 0.5.4 VS2010 project
| 
| 18/03/2011
| 
| Requirements :
| * OGRE_HOME environment variable
| 
| Remarks :
| * By default it assume you use Ogre3D with boost activated.
| If not, you have to edit the project property to remove additional include/librairies directory related to boost.
| 
| * Perhaps the shaders need improvment to remove bugs.
| 
| Naëm Baron.
