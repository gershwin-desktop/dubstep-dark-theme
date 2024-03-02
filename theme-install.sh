#!/bin/sh

# Use installation domain "USER" while under development of ds-base.
# Switch value this to "SYSTEM" on release
gmake install GNUSTEP_INSTALLATION_DOMAIN=USER && defaults write NSGlobalDomain GSTheme DubstepDark

