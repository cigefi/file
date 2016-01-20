for entry in *
do
	if [ -d "$entry" ];then
        for subdirs in $entry/*
        do	
			if [ -d "$subdirs" ];then
				for files in $subdirs/*.*
				do
					if [ -f "$files" ];then
						name="${files##*/}"
						subdir="${subdirs##*/}"
						newName="$subdir"_"$entry"_"$name"
						mv $files $newName
						echo "Archivo movido: "+"$newName"
					fi
				done
				if [ ! "$(ls -A $subdirs)" ];then
					rm -rf "$subdirs"
				fi
			fi
        done
        if [ ! "$(ls -A $entry)" ];then
            rm -rf "$entry"
        fi
    fi
done

read -n1 -r -p "Press any key to continue..." key