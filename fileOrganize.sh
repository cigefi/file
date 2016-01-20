for entry in *.*
do
  if [ -f "$entry" ]&&[ "${entry##*.}" != "sh" ];then
    name="${entry%.*}"
    IFS='_' read -r -a array <<< "${name:0:-5}"
	subFolder="${array[0]}"_"${array[1]}"
    folderName="${array[2]}"_"${array[3]}_${array[4]}_${array[5]}"
	newName="${name:${#name} - 4}.${entry##*.}"
	  if [ ! -d "$folderName" ];then
		mkdir $folderName
	  fi
	  if [ ! -d "$subFolder" ];then
		mkdir -p $folderName/$subFolder
	  fi
	  mv $entry $newName
	  mv $newName $folderName/$subFolder
	  echo "Archivo movido: "+"$entry"
  fi
done

read -n1 -r -p "Press any key to continue..." key
