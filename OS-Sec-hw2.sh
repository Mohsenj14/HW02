#!/bin/bash
# This program designed and developed by Mohsen Jalayeri in linux bash
# This is a basic program and I will update it regularly.
# you can access this file from: https://github.com/Mohsenj14/HW03

# Define alphabet
letter=(e t a o i n s h r d l c u m w f g y p b v k j x q z)
index=0
digraph=(th he in er an re nd at on nt ha es st en ed to it ou ea hi is or ti as te et ng of al de se le sa si ar ve ra ld ur)
words=(the and you that was for are with his they be this have from list one had by words but not what all were we when your can said there use each which she do how their if will up other about out many then them these so some her would make like him into time has look two more write go see number no way could people my than first water been called who am its now find long down day did get come made may part)


#cypher="GFS WMY OG LGDVS MF SFNKYHOSU ESLLMRS, PC WS BFGW POL DMFRQMRS, PL OG CPFU M UPCCSKSFO HDMPFOSXO GC OIS LMES DMFRQMRS DGFR SFGQRI OG CPDD GFS LISSO GK LG, MFU OISF WS NGQFO OIS GNNQKKSFNSL GC SMNI DSOOSK. WS NMDD OIS EGLO CKSJQSFODY GNNQKKPFR DSOOSK OIS 'CPKLO', OIS FSXO EGLO GNNQKKPFR DSOOSK OIS 'LSNGFU' OIS CGDDGWPFR EGLO GNNQKKPFR DSOOSK OIS 'OIPKU', MFU LG GF, QFOPD WS MNNGQFO CGK MDD OIS UPCCSKSFO DSOOSKL PF OIS HDMPFOSXO LMEHDS. OISF WS DGGB MO OIS NPHISK OSXO WS WMFO OG LGDVS MFU WS MDLG NDMLLPCY POL LYEAGDL. WS CPFU OIS EGLO GNNQKKPFR LYEAGD MFU NIMFRS PO OG OIS CGKE GC OIS 'CPKLO' DSOOSK GC OIS HDMPFOSXO LMEHDS, OIS FSXO EGLO NGEEGF LYEAGD PL NIMFRSU OG OIS CGKE GC OIS 'LSNGFU' DSOOSK, MFU OIS CGDDGWPFR EGLO NGEEGF LYEAGD PL NIMFRSU OG OIS CGKE GC OIS 'OIPKU' DSOOSK, MFU LG GF, QFOPD WS MNNGQFO CGK MDD LYEAGDL GC OIS NKYHOGRKME WS WMFO OG LGDVS."
cypher="GFS WMY OG LGDVS MF SFNKYHOSU ESLLMRS PC WS BFGW POL DMFRQMRS PL OG CPFU M UPCCSKSFO HDMPFOSXO GC OIS LMES DMFRQMRS DGFR SFGQRI OG CPDD GFS LISSO GK LG MFU OISF WS NGQFO OIS GNNQKKSFNSL GC SMNI DSOOSK WS NMDD OIS EGLO CKSJQSFODY GNNQKKPFR DSOOSK OIS CPKLO OIS FSXO EGLO GNNQKKPFR DSOOSK OIS LSNGFU OIS CGDDGWPFR EGLO GNNQKKPFR DSOOSK OIS OIPKU MFU LG GF QFOPD WS MNNGQFO CGK MDD OIS UPCCSKSFO DSOOSKL PF OIS HDMPFOSXO LMEHDS OISF WS DGGB MO OIS NPHISK OSXO WS WMFO OG LGDVS MFU WS MDLG NDMLLPCY POL LYEAGDL WS CPFU OIS EGLO GNNQKKPFR LYEAGD MFU NIMFRS PO OG OIS CGKE GC OIS CPKLO DSOOSK GC OIS HDMPFOSXO LMEHDS OIS FSXO EGLO NGEEGF LYEAGD PL NIMFRSU OG OIS CGKE GC OIS LSNGFU DSOOSK MFU OIS CGDDGWPFR EGLO NGEEGF LYEAGD PL NIMFRSU OG OIS CGKE GC OIS OIPKU DSOOSK MFU LG GF QFOPD WS MNNGQFO CGK MDD LYEAGDL GC OIS NKYHOGRKME WS WMFO OG LGDVS"
# Count leter
count()
{
for ((i=1;i<=26;i++)) do
	letternumber[2,$i]=$(grep -o "[${letternumber[1,$i]}]" <<<"$cypher" | wc -l)
done
}

#letternumber=({A..Z})

# Initial raw table
declare -A letternumber
num_rows=2
num_columns=26
temp=65
char=""
for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_columns;j++)) do
		if [ $i -eq 1 ]
		then
        letternumber[2,$j]=0
		elif [ $i -eq 2 ]
		then
		char=$(printf "\\$(printf '%03o' "$temp")")
		temp=$(($temp + 1))
		letternumber[1,$j]=$char
		fi
    done
done

# Find high frequency used letter
findmax()
{
ii=0
max=${letternumber[2,1]}
char="A"
for ((i=1;i<=26;i++)) do
    if [ ${letternumber[2,$i]} -gt $max ]
		then
		ii=$i
		max=${letternumber[2,$i]}
		char=${letternumber[1,$i]}
	fi
done
letternumber[2,$ii]=0
printf "\n=====================================\n"
echo "**********  Find most repeat char = "$char
echo "**********  Times of repeat = " $max

}

# Replace letter
replace() {
echo "**********  Replaced with = "${letter[$index]}
cypher=$(tr $char ${letter[$index]} <<<"$cypher")
printf "=====================================\n\n"
printf "********************   New text is:     ******************         \n\n"
echo $cypher
index=$index+1
}

countword()
{
wordnumber=$(echo "$cypher" | wc -w)
declare -A semicypher
		arr=($cypher)
#		echo ${arr[1]} 
		#echo ${arr[2]}
#semicypher[0,0]=${arr[0]}
#semicypher[1,0]=1


for word in $cypher; do 
#	echo $word; 
#	echo $cypher | awk '{print gsub($word, "")}'

	if [[ $cypher == *$word* ]]; then
		#echo "It's there!"
		for ((k=0; k<${#semicypher[@]}; k++)); do
		echo "in loop semi"
			if [[ ${semicypher[$k]} == $word ]]; then
				echo "Element $i matched"
				semicypher[2,$k]=$((${semicypher[2,$k]}+1))
			else
				semicypher[1,$(($k+1))]=$word
			fi
		done
	
	fi
done

echo ${semicypher[0,1]}
	
#echo $cypher | awk '{print gsub(/GC/, "")}'

#for ((i=0;i<$wordnumber;i++)) do
	#for ((j=$((i+1));j<$wordnumber;j++)) do
	#		if [ ${semicypher[$i]} == ${arr[$j]} ]
	#		then
	#		semicypher[1,$i]=$(({$semicypher[1,$i]} + 1))
	#		arr[$j]=" "
	#done
#done
}

#letternumber[1,1]="A"
#echo ${letternumber[0,0]}
#letternumber[2][26]=({A}{0})




# Start point
count
findmax
replace
findmax
replace
countword



#for word in $cypher; do 
	#echo $word; 
	
	#done
	
