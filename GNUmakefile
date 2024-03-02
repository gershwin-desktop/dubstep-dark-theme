include $(GNUSTEP_MAKEFILES)/common.make

PACKAGE_NAME = DubstepDark
BUNDLE_NAME = DubstepDark
BUNDLE_EXTENSION = .theme
VERSION = 0.1

$(BUNDLE_NAME)_INSTALL_DIR=$(GNUSTEP_LIBRARY)/Themes
$(BUNDLE_NAME)_PRINCIPAL_CLASS = Dubstep

$(BUNDLE_NAME)_OBJC_FILES = \
		Dubstep.m \
		Dubstep+Button.m \
		DubstepScrollerKnobSlotCell.m \
		DubstepScrollerKnobCell.m \
		DubstepScrollerArrowCell.m \
		Dubstep+Scroller.m


$(BUNDLE_NAME)_RESOURCE_FILES = \
	./Resources/ThemeIcon.png\
         ./Resources/ThemePreview.png\
	./Resources/ThemeImages\
	./Resources/ThemeTiles\
	./Resources/*.clr
-include GNUmakefile.preamble

include $(GNUSTEP_MAKEFILES)/bundle.make

-include GNUmakefile.postamble

