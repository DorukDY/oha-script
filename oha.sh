#! /bin/bash

version="1.0"

infoFileLoc=info.txt

showHelp(){
echo "Usage: oha [OPTION]..."
echo "Continue to learn."
echo
echo " -n       prints n exiciting information"
echo
echo "     --help     display this help and exit"
echo "     --version  output version information and exit"
echo
echo "Created by Drk"
}

showErr(){
    echo -e "oha: invalid option -- '$1'" >&2
    echo -e "Try 'oha --help ' for more information." >&2
    exit 1
}

getInfo(){
    local order=$(($RANDOM % 500 + 1))
    
    local info=$(sed -n "${order}p" ${infoFileLoc} 2>/dev/null)
    echo $info
}



case $1 in
    "")
    getInfo;;
    "--help"|"-h")
        showHelp
        ;;
    "--version")
        echo "oha $version";;
    -* )
        if [[ "$1" =~ ^-[0-9]+$ ]]; then
            count=${1#-} # - işaretini kaldırır.
            for i in $(seq 1 "$count")
            do
                echo -n "$i) " 
                getInfo
            done 
        else
            showErr
        fi 
        ;;
    *)
        showErr $1;;
esac



