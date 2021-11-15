user= "endika.eiros"
ip= "35.216.168.201"

dir=""                  #DIRECCION DE COPIA COMPLETA
dirssh=""               #DIRECCION DONDE SE ALMACENA EN EL REMOTO
compare=""              #OPCION DE --compane-dest del comando scp

function completasubir(){
    rsync -avh $dir $user"@"$ip":"$dirssh
    exit 0
}

function incrementalsubir(){
    mkdir copia
    rsync -avh --compare-dest=$compare $dir $pwd"/copia"
    scp $dir $user"@"$ip":"$dirssh
    rm -r copia
    exit 0
}

function completa(){
    echo "se guarda en " $pwd
    rsync -avh $dir $pwd
    exit 0
}

function incremental(){
    mkdir copia
    rsync -avh --compare-dest=$compare $dir $pwd"/copia"
    exit 0
}

function subir(){
    scp $dir $user"@"$ip":"$dirssh
    exit 0
}




function main(){
    opcion=0
    echo -e "introduce el numero de la funcion que se va a realizar "
    while opcion -ne 0 do
        echo -e "0 - Salir"
        echo -e "1 - Generar copia completa y generar backup mediante ssh"
        echo -e "2 - Generar copia incremental y subirlo por ssh"
        echo -e "3 - Generar copia completa"
        echo -e "4 - Generar copia incremental"
        echo -e "5 - Subir archivo"

        echo ""
        read -p "Elige una opcion: " opcion


    case $opcion in

   		1) completasubir;;
        2) incrementalsubir;;
        3) completa;;
        4) incremental;;
        5) subir;;
        *) ;;

    	esac
      
    done
}
main
