#!/bin/bash

clear

## array of menu entries
entries=(
          "build omnibus f4v3"
          "build matek f405 wing"
          "build matek f411 wing"
	        "build omnibus f4pro"
          "build all"
          "exit"
          )

## set prompt for select menu
PS3='Enter selection: '

while [ "$menu" != 1 ]; do                ## outer loop redraws menu each time
    printf "\niNAV build menu: select hardware to build\n\n"             ## heading for menu
    select choice in "${entries[@]}"; do  ## select displays choices in array
        case "$choice" in                 ## case responds to choice
            "build omnibus f4v3" )
                make clean TARGET=OMNIBUSF4V3
                make TARGET=OMNIBUSF4V3
                read -p "Press [Enter] key to continue..."
                clear
                break                     ## break returns control to outer loop
                ;;
            "build matek f405 wing" )
                make clean TARGET=MATEKF405SE
                make TARGET=MATEKF405SE
                read -p "Press [Enter] key to continue..."
                clear
                break                     ## break returns control to outer loop
                ;;
            "build matek f411 wing" )
                make clean TARGET=MATEKF411
                make TARGET=MATEKF411
                read -p "Press [Enter] key to continue..."
                clear
                break                     ## break returns control to outer loop
                ;;
	          "build omnibus f4pro" )
                make clean TARGET=OMNIBUSF4PRO
                make TARGET=OMNIBUSF4PRO
                read -p "Press [Enter] key to continue..."
                clear
                break                     ## break returns control to outer loop
                ;;
            "build all" )
                for dir in src/main/target/*; do
                  make clean ${dir##*/};
                  make ${dir##*/};
                  done
                read -p "Press [Enter] key to continue..."
                clear
                break                     ## break returns control to outer loop
                ;;
            "exit" )
                echo "Exiting"
                menu=1                    ## variable setting exit condition
                break
                ;;
            * )
                clear1
                break
                ;;
        esac
    done
done

exit 0

for file in sample/*; do
    echo "$(basename "$file")"
done
