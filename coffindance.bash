#!/bin/bash

#########################
# a script by lazy-pwny #
#########################

# renkler
    moruq='\033[95m'
    cyan='\033[96m'
    darkcyan='\033[36m'
    mavi='\033[94m'
    yesil='\033[92m'
    sari='\033[93m'
    kirmizi='\033[91m'
    huseyinbold='\033[1m'
    underline='\033[4m'
    end='\033[0m'
#

if [[ $1 = help ]] ; then
    echo "1"
fi

if [[ $USER == root ]] ; then
    echo ok > /dev/null
    else
    echo -e "$kirmizi lütfen 'sudo' ile deneyin $tp"
    exit 1
fi

echo -e "$kirmizi Coffin Dance V0.1$end (Beta)"
sleep 0.2 # gereksiz sleep xd

while :; do
if [[ $target = "" ]] ; then
    iftarg="yok"
    echo -e "${moruq}önce bir hedef belirlemelisin!$end (/'-')/--{1. yi seç ve oradan hedefini belirle}"
else
    iftarg="var"
fi
    echo -e "Hedef:$kirmizi $target $end"
    echo "0-) çıkış"
    echo "1-) hedef belirleme seçenekleri"
    echo "2-) açık port taraması."
    echo "3-) açık port taraması ve version tesbiti"
    echo "4-) derinlemesine port taraması"
    echo "c-) ekranı temizleme(clear)"
    echo -ne "${huseyinbold}CoffinDance~$ ${end}" ; read a
if [[ $a =~ ^(0|exit) ]]  ; then
    echo "Bye! [*-*]"
    exit 0
elif [[ $a =~ ^(c|clear) ]] ; then
    clear
elif [[ $a = 1 ]] ; then
    clear
    echo "-------------------------------------------------------"
    echo "| 0-) <- geri                                         |"
    echo "| 1-) alan adından ip alma (kesin sonuç vermeyebilir) |"
    echo "| 2-) custom ip (*.*.*.* şeklinde kendiniz verirsiniz)|"
    echo "|-----------------------------------------------------|"
    echo -n "option: " ; read b
    if [[ $b = 0 ]] ; then
        echo "ok" > /dev/null
    elif [[ $b = 1 ]] ; then
        echo -n "alan adı giriniz("www.example.com" şeklinde): " ; read c
        target=$(ping -c 1 $c | awk 'NR==1{print $3}' | tr -d "()")
        clear
    elif [[ $b = 2 ]] ; then
        echo -n "ip adresini giriniz("*.*.*.*") şeklinde: " ; read target
        clear
    fi 
fi

if [[ $iftarg = var ]] ; then
    if [[ $a = 2 ]] ; then
        echo "-------------------------------------------------------"
        echo "               *açık port taraması*"
        echo "-------------------------------------------------------"
        echo "işlem uzun sürebilir.. Sen takıl dalgana bak."
        echo "-------------------------------------------------------"
        nmap -Pn -sS -n -v --reason --open $target
        echo "-------------------------------------------------------"
        echo "              *Tamamlandı*"
        echo "-------------------------------------------------------"
    elif [[ $a = 3 ]] ; then
        echo "-------------------------------------------------------"
        echo "        *açık port taraması ve version tesbiti*"
        echo "-------------------------------------------------------"
        echo "işlem uzun sürebilir.. Sen takıl dalgana bak."
        echo "-------------------------------------------------------"
        nmap -sS -sV -sC -n -v $target
        echo "-------------------------------------------------------"
        echo "              *Tamamlandı*"
        echo "-------------------------------------------------------"
    elif [[ $a = 4 ]] ; then 
        echo "-------------------------------------------------------"
        echo "             *derinlemesine port taraması*"
        echo "-------------------------------------------------------"
        echo "işlem çok uzun sürebilir.. Sen takıl dalgana bak."
        echo "tarama devam ediyor durumu görmek için enter'a basınız "
        echo "-------------------------------------------------------"
        nmap -sS -sV -sC -n -p- $target
        echo "-------------------------------------------------------"
        echo "              *Tamamlandı*"
        echo "-------------------------------------------------------"
    fi
fi
done