for entry in *
do
    if [ -d "$entry" ];then
        for files in $entry/*.*
        do
            if [ -f "$files" ];then
                name="${files##*/}"
                newName="$entry"_"$name"
		mv $files $newName
                echo "Archivo movido: "+"$newName"
            fi
        done
        if [ ! "$(ls -A $entry)" ];then
            rm -rf "$entry"
        fi
    fi
done
