STUDIO_LINK="https://dl.google.com/dl/android/studio/ide-zips/1.0.1/android-studio-ide-135.1641136-linux.zip"
ZIP_LOC="/home/vagrant/android-studio.zip"
STUDIO_LOC="/home/vagrant/android-studio"
INIT_FILE="/vagrant/scripts/studio.init"

# Download Android Studio
if ! [ -e $ZIP_LOC ]
then
	echo "Downloading Android Studio"
	wget $STUDIO_LINK -O "android-studio.zip"
else
	echo "Android Studio download detected at $ZIP_LOC"
fi

# Unzip Android Studio
if ! [ -e $STUDIO_LOC ]
then
	echo "Unzipping Android Studio"
	unzip -d $STUDIO_LOC $ZIP_LOC
else
	echo "Android Studio folder detected at $STUDIO_LOC"
fi

# Arrange to auto-start Android Studio at boot time.
sudo cp $INIT_FILE /etc/init.d/studio
sudo chmod +x /etc/init.d/studio
sudo update-rc.d studio defaults 
