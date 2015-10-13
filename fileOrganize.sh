for entry in *.*
do
  if [ -f "$entry" ]&&[ "${entry##*.}" != "sh" ];then
    name="${entry%.*}"
    folderName="${name:0:-5}"
    newName="${name:${#name} - 4}.${entry##*.}"
      if [ ! -d "$folderName" ];then
        mkdir $folderName
      fi
      mv $entry $newName
      mv $newName $folderName
      echo "Archivo movido: "+"$entry"
  fi
done


