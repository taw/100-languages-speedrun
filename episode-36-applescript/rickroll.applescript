#!/usr/bin/env osascript

tell application "System Events"
  tell process "Google Chrome"
    click menu item "New Window" of menu "File" of menu bar 1
    activate
  end tell
  delay 0.5
  # Cmd-T to open a new tab
  keystroke "t" using command down
  # Type something
  keystroke "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  # Press enter
  key code 36
end tell
