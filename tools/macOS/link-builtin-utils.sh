#!/bin/sh
echo "linking airport..."
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
echo "Done!"
echo "linking jsc..."
sudo ln -s /System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc /usr/local/bin/jsc
echo "Done!"
