# Thanks to Christopher Sexton
# https://gist.github.com/965032
function kapow {
  FOLDERNAME=$1
  if [ -z "$FOLDERNAME" ]; then; FOLDERNAME=${PWD##*/}; fi
	touch ~/.pow/$FOLDERNAME/tmp/restart.txt
	if [ $? -eq 0 ]; then
		echo "$fg[yellow]Pow restarting $FOLDERNAME...$reset_color"
	fi
}

compctl -W ~/.pow -/ kapow
