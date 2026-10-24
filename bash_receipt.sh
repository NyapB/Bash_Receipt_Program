#!/bin/bash

#asking th ecustomer information

read -p "What is the customer's name? : " name
if [[ -z "$name" ]]; then
    name="client"
fi 
read -p "What did the customer buy? : " item
if [[ -z "$item" ]]; then
    printf "Error : No item given"
    exit 1
fi
read -p "What is the unit price fr what she bought? : " unitprice
if [[ -z "$unitprice" || "$unitprice" == *[!0-9]* ]]; then
   echo "Error : unit price must be whole number"
    exit 1
fi 
read -p "What quantity did she buy? : " Quantity
if [[ -z "$Quantity" || "$Quantity" == *[!0-9]* ]]; then
   echo "Error : unit price must be whole number"
   exit 1
fi 
if [[ $Quantity -lt 1 || $Quantity -gt 1000 ]]; then
    echo "Error : Quantity must be a whole number"
    exit 1
fi

clear

subtotal=$((unitprice*Quantity))

 if (( subtotal<20000));then
     discount=0
elif (( $subtotal < 100000 )); then
    discount=$((5*subtotal/100))
else
    discount=$((10*subtotal/100))
fi

v=$((subtotal-discount))

VAT=$((v*1925/10000))
t="VAT is 19.25%"

total=$((subtotal-discount+VAT))

 printf "Customer : $name\n"
 printf "Item : $item\n"
 printf "Unit price (FCFA): $unitprice\n"
 printf "Quantity: $Quantity\n"

 printf "====================================\n"
 printf "  MOKOLO WHOLESALE . RECEIPT #$RANDOM\n"
 printf "  $(date +"%d/%m/%Y %H:%M")\n"
 printf "====================================\n"

 printf "Customer : $name\n"# printf "Item : $item*$Quantity\n"
 printf "____________________________________\n"

printf "Subtotal : $subtotal\n"
printf "Discount : -$discount\n"
printf "%b" "$t: $VAT\n"
printf "______________________________________\n"
printf "TOTAL : $total\n"





