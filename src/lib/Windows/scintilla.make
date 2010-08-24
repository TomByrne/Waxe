##############################################################################
## File:        Makefile
## Purpose:     wxScintilla
## Maintainer:  Otto Wyss
## Created:     2004-09-19
## RCS-ID:      $Id: Makefile,v 1.13 2006/03/14 19:10:49 wyo Exp $
## Copyright:   (c) 2004 wxCode
## Licence:     wxWindows
##############################################################################

# list of source files
SRC = PlatWX.cpp \
      ScintillaWX.cpp \
      wxscintilla.cpp \
      AutoComplete.cxx \
      CallTip.cxx \
      CellBuffer.cxx \
      CharClassify.cxx \
      ContractionState.cxx \
      Document.cxx \
      DocumentAccessor.cxx \
      Editor.cxx \
      Indicator.cxx \
      KeyMap.cxx \
      KeyWords.cxx \
      LexAda.cxx \
      LexAPDL.cxx \
      LexAsm.cxx \
      LexAsn1.cxx \
      LexAU3.cxx \
      LexAVE.cxx \
      LexBaan.cxx \
      LexBash.cxx \
      LexBasic.cxx \
      LexBullant.cxx \
      LexCaml.cxx \
      LexCLW.cxx \
      LexConf.cxx \
      LexCPP.cxx \
      LexCrontab.cxx \
      LexCsound.cxx \
      LexCSS.cxx \
      LexEiffel.cxx \
      LexErlang.cxx \
      LexEScript.cxx \
      LexFlagship.cxx \
      LexForth.cxx \
      LexFortran.cxx \
      LexGui4Cli.cxx \
      LexHaskell.cxx \
      LexHTML.cxx \
      LexInno.cxx \
      LexKix.cxx \
      LexLisp.cxx \
      LexLout.cxx \
      LexLua.cxx \
      LexMatlab.cxx \
      LexMetapost.cxx \
      LexMMIXAL.cxx \
      LexMPT.cxx \
      LexMSSQL.cxx \
      LexOpal.cxx \
      LexNsis.cxx \
      LexOthers.cxx \
      LexPascal.cxx \
      LexPB.cxx \
      LexPerl.cxx \
      LexPOV.cxx \
      LexPS.cxx \
      LexPython.cxx \
      LexRebol.cxx \
      LexRuby.cxx \
      LexScriptol.cxx \
      LexSmalltalk.cxx \
      LexSpecman.cxx \
      LexSQL.cxx \
      LexTADS3.cxx \
      LexTCL.cxx \
      LexTeX.cxx \
      LexVB.cxx \
      LexVerilog.cxx \
      LexVHDL.cxx \
      LexYAML.cxx \
      LexSpice.cxx \
      LineMarker.cxx \
      PropSet.cxx \
      RESearch.cxx \
      ScintillaBase.cxx \
      Style.cxx \
      StyleContext.cxx \
      UniConversion.cxx \
      ViewStyle.cxx \
      WindowAccessor.cxx \
      XPM.cxx

# source directories
vpath %.cpp ../src
vpath %.cxx ../src/scintilla/src

# additional header directories
INC = -I../include \
      -I../src/scintilla/include \
      -I../src/scintilla/src \
		-Ie:/hugh/dev/code.google/waxe/src/include/

DEF = -D__WX__=1 -DSCI_LEXER -DLINK_LEXERS -DHX_WINDOWS -D_CRT_SECURE_NO_DEPRECATE  /EHsc -GR

# objects
OBJ = $(patsubst %.cxx,%.obj,$(SRC:.cpp=.obj))

# library
LIB = libwxscintilla


%.obj:	%.cpp
	cl -nologo $(DEF) $(INC) -O2 -c $< -Fo$@

%.obj:	%.cxx
	cl -nologo $(DEF) $(INC) -O2 -c $< -Fo$@

all:	$(LIB).a
$(LIB).a:	$(OBJ)
	lib -nologo -out:../lib/$@ $^

