# Raccourci situé dans /etc/profile.d/

# Script permettant de charger la config couleur de Rofi

FILE=~/.config/.Xressources

if [ -f "$FILE" ]; then

    xrdb $FILE

else

    wget -O $FILE https://raw.githubusercontent.com/Zami3l/linux/master/rofi/.Xressources.bluegrey && \
    xrdb $FILE

fi
