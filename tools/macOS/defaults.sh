#!/bin/sh

# Safari
echo "Setting defaults for Safari..."
defaults write -g WebKitDeveloperExtras -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
echo "Done!"

echo "Setting defaults for TextEdit..."
# TextEdit
defaults write com.apple.TextEdit RichText -bool false
echo "Done!"

echo "Setting defaults for Dock..."
# Dock
defaults write com.apple.dock autohide -bool true
echo "Done!"

# Finder
echo "Setting defaults for Finder..."
defaults write -g AppleShowAllExtensions -bool
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
echo "Done!"

# AirDrop
echo "Setting defaults for AirDrop..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
echo "Done!"
