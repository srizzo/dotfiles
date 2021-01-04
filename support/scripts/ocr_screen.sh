#!/usr/bin/env bash

set -e

osascript <<EOF
tell application "Finder" to do shell script "exec screencapture -i /tmp/ocr.png"
EOF

/usr/local/bin/tesseract -l eng /tmp/ocr.png /tmp/ocr
sed '$d' /tmp/ocr.txt | pbcopy
osascript <<EOF
set t to (the clipboard as text)
try
	display dialog t buttons {"Cancel", "Edit"} cancel button "Cancel" default button "Edit"

	set x to button returned of result

	if x is "Edit" then
		do shell script "pbpaste | /usr/local/bin/mate"
	end if
on error errorMessage number errorNumber
	# do nothing
end
EOF

