#!/bin/bash
#https://www.gnupg.org/gph/en/manual/x56.html
ssh(){
    ssh-keygen -t rsa
    cat ~/.ssh/id_rsa.pub > ssh.txt
}

#1) Anadirclave
anadirclave(){
    gpg --import ARCHIVO.asc
}


#2) verificar
verificar(){
    gpg --verify ARCHIVO.gpg
}


#3) Crear clave
crearclave(){
  gpg --gen-key

}

#4) CifraryFirmar 
CifraryFirmar(){
    gpg --encrypt --sign -r correo archivo
}
#5) encriptarClace
encriptarClace(){
    gpg -c archivo
}

#SALIR
function fin()
{
	echo -e "¿Quieres salir del programa?(S/N)\n"
        read respuesta
	if [ $respuesta == "N" ] then
		opcionmenuppal=0
	else
    exit 0
  fi
}

### Main ###
function main(){

    opcionmenuppal=0
    while test $opcionmenuppal -ne 99
    do
    	#Muestra el menu
        echo -e "1) anadirclave "
        echo -e "2) verificar "
        echo -e "3) crearclave    "
        echo -e "4) habilitarCambios    "
	echo -e "5) encriptarClace    "
	   echo -e "9) Fin  "
        
        echo ""
        read -p "Elige una opcion: " opcionmenuppal
                

    	case $opcionmenuppal in

            1) anadirclave;;
            2) verificar;;
            3) crearclave;;
            4) habilitarCambios;;
            5) encriptarClace;;
		
		
		  9) fin;;
        *) ;;

    	esac

    done

}
main
