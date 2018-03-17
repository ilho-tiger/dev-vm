#!/bin/bash

email_address="your.email@domain.com"

# getting user's email address
input=$(whiptail --title "Specifying identity" --inputbox "Type your email address below:" 10 60 ${email_address} 3>&1 1>&2 2>&3)
exitstatus=$?
if [[ ${exitstatus} == 0 ]]; then
    email_address=${input}
    echo "Creating SSH key pair for ${input}"
else
    echo "canceled."
    exit 1
fi

output_dir="./keys/"
output_path="${output_dir}${email_address}_id_rsa"

# generate a new SSH key pair
mkdir ${output_dir}
ssh-keygen -t rsa -C "${email_address}" -b 4096 -f ${output_path}
