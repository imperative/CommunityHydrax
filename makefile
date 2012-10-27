# Makefile for Hydrax v0.5.3
# version of Jose Luis Cercós Pita
# Ubuntu 10.04
# GCC Compiler
# Release version
# Shared library

# ----------------------------------------
# Install prefix (default = /usr)
# ----------------------------------------
ifndef PREFIX
	PREFIX =/usr
endif

# ----------------------------------------
# Only for Debian installer purposes,
# don't use it if you don't know what are
# you doing.
# ----------------------------------------
ifndef DESTDIR
	DESTDIR =
endif

# ----------------------------------------
# OGRE Flags
# ----------------------------------------
OGRE_CFLAGS = -I$(PREFIX)/include/OGRE
OGRE_LDFLAGS = -L$(PREFIX)/lib -lOgreMain

# ----------------------------------------
# Collect Flags
# ----------------------------------------
CFLAGS = -s -O2 -fPIC -c $(OGRE_CFLAGS) -I./include/
LDFLAGS = -shared $(OGRE_LDFLAGS)

# ----------------------------------------
# Compilers
# ----------------------------------------
# Detecting 64 bits version
ARCH =$(shell uname -m | grep 64)
# Verbose compiling
ifdef VERBOSE
	CC = g++
	LD = g++
	# 64 bits version
	ifneq "$(strip $(ARCH))" ""
		CC = g++ -m64
		LD = g++ -m64
	endif
	CP = cp
	RM = rm
	LN = ln
	MKDIR = mkdir
else
	CC = @g++
	LD = @g++
	# 64 bits version
	ifneq "$(strip $(ARCH))" ""
		CC = @g++ -m64
		LD = @g++ -m64
	endif
	CP = @cp
	RM = @rm
	LN = @ln
	MKDIR = @mkdir
endif

# ----------------------------------------
# Output
# ----------------------------------------
NAME=libhydrax.so.0.5.3
OUTPUTOBJPREFIX=lib/Release/
OUTPUT = $(OUTPUTOBJPREFIX)$(NAME)
SRCOBJPREFIX = src/

# ----------------------------------------
# Objects
# ----------------------------------------
OBJPREFIX = obj/Release/
OBJECTS = $(OBJPREFIX)CfgFileManager.o $(OBJPREFIX)DecalsManager.o $(OBJPREFIX)Enums.o $(OBJPREFIX)GodRaysManager.o $(OBJPREFIX)GPUNormalMapManager.o \
	$(OBJPREFIX)Help.o $(OBJPREFIX)Hydrax.o $(OBJPREFIX)Image.o $(OBJPREFIX)MaterialManager.o \
	$(OBJPREFIX)Mesh.o $(OBJPREFIX)Prerequisites.o $(OBJPREFIX)RttManager.o $(OBJPREFIX)TextureManager.o \
	$(OBJPREFIX)Modules/Module.o $(OBJPREFIX)Modules/ProjectedGrid/ProjectedGrid.o $(OBJPREFIX)Modules/RadialGrid/RadialGrid.o \
	$(OBJPREFIX)Modules/SimpleGrid/SimpleGrid.o $(OBJPREFIX)Noise/Noise.o $(OBJPREFIX)Noise/FFT/FFT.o $(OBJPREFIX)Noise/Perlin/Perlin.o \
	$(OBJPREFIX)Noise/Real/Real.o $(OBJPREFIX)Noise/Real/Wave.o $(OBJPREFIX)Noise/Real/PressurePoint.o

# -------- Compiling targets -----------------------------------------------------
# all target:
# Need build all paths for objets & libraries. Then build the otuput
all: dirs $(OUTPUT)

# OUTPUT target:
# Call to compile all source files, then link it.
$(OUTPUT): $(OBJECTS)
	@echo "\033[1;1;34m Linking $(OUTPUT)... \033[0m"
	$(LD) $(LDFLAGS) $(OBJECTS) -o $(OUTPUT)
	@echo "\033[1;1;31m Built $(OUTPUT)! \033[0m"

# OBJECTS targets:
# Compile all the source files
$(OBJPREFIX)CfgFileManager.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)CfgFileManager.cpp
$(OBJPREFIX)DecalsManager.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)DecalsManager.cpp
$(OBJPREFIX)Enums.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Enums.cpp
$(OBJPREFIX)GodRaysManager.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)GodRaysManager.cpp
$(OBJPREFIX)GPUNormalMapManager.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)GPUNormalMapManager.cpp
$(OBJPREFIX)Help.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Help.cpp
$(OBJPREFIX)Hydrax.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Hydrax.cpp
$(OBJPREFIX)Image.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Image.cpp
$(OBJPREFIX)MaterialManager.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)MaterialManager.cpp
$(OBJPREFIX)Mesh.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Mesh.cpp
$(OBJPREFIX)Prerequisites.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Prerequisites.cpp
$(OBJPREFIX)RttManager.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)RttManager.cpp
$(OBJPREFIX)TextureManager.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)TextureManager.cpp
$(OBJPREFIX)Modules/Module.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Modules/Module.cpp
$(OBJPREFIX)Modules/ProjectedGrid/ProjectedGrid.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Modules/ProjectedGrid/ProjectedGrid.cpp
$(OBJPREFIX)Modules/RadialGrid/RadialGrid.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Modules/RadialGrid/RadialGrid.cpp
$(OBJPREFIX)Modules/SimpleGrid/SimpleGrid.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Modules/SimpleGrid/SimpleGrid.cpp
$(OBJPREFIX)Noise/Noise.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Noise/Noise.cpp
$(OBJPREFIX)Noise/FFT/FFT.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Noise/FFT/FFT.cpp
$(OBJPREFIX)Noise/Perlin/Perlin.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Noise/Perlin/Perlin.cpp
$(OBJPREFIX)Noise/Real/Real.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Noise/Real/Real.cpp
$(OBJPREFIX)Noise/Real/Wave.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Noise/Real/Wave.cpp
$(OBJPREFIX)Noise/Real/PressurePoint.o:
	@echo "\033[1;1;32m Compiling $@. \033[0m"
	$(CC) $(CFLAGS) -o $@ $(SRCOBJPREFIX)Noise/Real/PressurePoint.cpp

# clean target:
# Remove objects/binaries
clean:
	$(RM) -rf obj lib
	@echo "\033[1;1;31m Cleaned. \033[0m"

# dirs target:
# Builds folders for the objects & binaries
dirs:
	@echo "\033[1;1;34m Creating needed paths... \033[0m"
	$(MKDIR) -p obj
	$(MKDIR) -p obj/Release
	$(MKDIR) -p obj/Release/Modules
	$(MKDIR) -p obj/Release/Noise
	$(MKDIR) -p obj/Release/Modules/ProjectedGrid
	$(MKDIR) -p obj/Release/Modules/RadialGrid
	$(MKDIR) -p obj/Release/Modules/SimpleGrid
	$(MKDIR) -p obj/Release/Noise/FFT
	$(MKDIR) -p obj/Release/Noise/Perlin
	$(MKDIR) -p obj/Release/Noise/Real
	$(MKDIR) -p lib
	$(MKDIR) -p lib/Release

# -------- Installing targets ---------------------------------------------------
# install target:
# Call to install all parts (Libraries, includes and media).
install: InstLib InstInc InstMedia
	@echo "\033[1;1;31m Installed! \033[0m"

# install library target:
# Make the folder for the library, copy the output into, 
# remove any other library with the same name, and make symbolic
# link to the library.
InstLib:
	@echo "\033[1;1;34m Installing library (into $(DESTDIR)$(PREFIX)/lib)... \033[0m"
	$(MKDIR) -p $(DESTDIR)$(PREFIX)/lib
	$(CP) $(OUTPUT) $(DESTDIR)$(PREFIX)/lib/$(NAME) 
	$(RM) -f $(DESTDIR)$(PREFIX)/lib/libhydrax.so 
	$(LN) -s -T ./$(NAME) $(DESTDIR)$(PREFIX)/lib/libhydrax.so

# install library target:
# Make the destination folder, and copy all includes into.
InstInc:
	@echo "\033[1;1;34m Installing header files (into $(DESTDIR)$(PREFIX)/include/Hydrax)... \033[0m"
	$(MKDIR) -p $(DESTDIR)$(PREFIX)/include/Hydrax/Modules/ProjectedGrid $(DESTDIR)$(PREFIX)/include/Hydrax/Modules/RadialGrid $(DESTDIR)$(PREFIX)/include/Hydrax/Modules/SimpleGrid $(DESTDIR)$(PREFIX)/include/Hydrax/Noise/FFT $(DESTDIR)$(PREFIX)/include/Hydrax/Noise/Perlin $(DESTDIR)$(PREFIX)/include/Hydrax/Noise/Real
	$(CP) -R include/* $(DESTDIR)$(PREFIX)/include/Hydrax

# install library target:
# Make the destination folder, and copy all media into.
InstMedia:
	@echo "\033[1;1;34m Installing media files (into $(DESTDIR)$(PREFIX)/share/Hydrax)... \033[0m"
	$(MKDIR) -p $(DESTDIR)$(PREFIX)/share/Hydrax/Media
	$(CP) -R Media/* $(DESTDIR)$(PREFIX)/share/Hydrax/Media

# Show a help page:
help:
	@echo "Hydrax make file help page."
	@echo "Using:"
	@echo "\tmake [Objective] [Options]"
	@echo ""
	@echo "Valid objectives can be:"
	@echo "\thelp"
	@echo "\t\tShow this help page."
	@echo "\tclean"
	@echo "\t\tRemoves all compiled files."
	@echo "\tall"
	@echo "\t\tCompile all (Default objective)."
	@echo "\tinstall"
	@echo "\t\tInstall the libraries into $(DESTDIR)$(PREFIX)/lib, the header files into $(DESTDIR)$(PREFIX)/include, and the media files into $(DESTDIR)$(PREFIX)/share/Hydrax/Media."
	@echo "If any objective is specified, all objective will be performed."
	@echo ""
	@echo "Valid options can be:"
	@echo "\tDESTDIR=Destination directory."
	@echo "\t\tUsed to perform debian packages, can be used to install into specified directory with the same structure of root. Normal users don't want to use this variable."
	@echo "\tPREFIX=Install path. (default value = /usr)"
	@echo "\t\tPath where all data will be installed. This path must have a subfolder called lib, another called include, and another called share."
	@echo "\tVERBOSE=0/1. (default value = 0)"
	@echo "\t\tHide/Show additional info in the compile process."
	@echo ""
	@echo "Example:"
	@echo "\tmake clean"
	@echo "\tmake all"
	@echo "\tsudo make install"

