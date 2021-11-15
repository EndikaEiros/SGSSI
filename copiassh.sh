
#read -p "Mete la IP" ip
#read -p "Mete el usuario" usuario
usuario="endika.eiros"
ip="35.216.168.201"

dir="/home/endika/Escritorio/seguridad"                  #DIRECCION DE COPIA COMPLETA
dirssh="/home/endika.eiros/backup"               #DIRECCION DONDE SE ALMACENA EN EL REMOTO
compare="/home/endika/Escritorio/copia"              #OPCION DE --compane-dest del comando scp Ultima copia completa

function completasubir(){
    sudo rsync -avh $dir $usuario"@"$ip":"$dirssh
    exit 0
}

function incrementalsubir(){
 
    rsync -avh --compare-dest=$compare $dir $compare"/incremental"
    scp -r $compare"/incremental" $usuario"@"$ip":"$dirssh"/incremental"
    #rm -r copia
    exit 0
}

function completa(){
    echo "se guarda en " $compare
    mkdir copia
    sudo rsync -avh $dir $compare
    exit 0
}

function incremental(){
    mkdir copia/incremental
    rsync -avh --compare-dest=$compare $dir $compare"/incremental"
    exit 0
}

function subirincremental(){
    echo "Se entiende que ha realizado la funcion 4 antes"
    scp $compare"/incremental" $usuario"@"$ip":"$dirssh
    exit 0
}




function main(){
    opcion=-1
    echo -e "introduce el numero de la funcion que se va a realizar "
    while test $opcion -ne 0 
    do
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
            5) subirincremental;;
            *) ;;

    	esac
      
    done
}
main
