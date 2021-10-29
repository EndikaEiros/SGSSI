import math
import os
#Script de analisis de frecuencia

frec = {}
frec_español={'E':16.78,'R':4.94,'Y':1.54,'A':11.96,'U':4.80,'Q':1.53,'O':8.69,'I':	4.15,'B':0.92,'L':8.37,'T':3.31,'H':0.89,'S':7.88,'C':2.92,'G':	0.73,'N':7.01,'P':2.76,'F':	0.52,'D':6.87,'M':2.12}
null_values={' ', ",",".", "\n",'1','2','3','4','5','6','7','8','9','0'}
f = open("texto.txt", "r")
texto = open("texto.txt", "r").read()
num=0

#Contar la frecuencia de cada caracter
c=f.read(1)
while c:
    c=c.upper() #Evitar que haya mayusculas y minusculas en el diccionario
    if c not in null_values:
        if c in frec:
            n=frec.get(c)
            frec[c]=n+1
        else:
            frec[c]=1
        num=num+1
    c=f.read(1)

#cambiar de valores absolutos a valores relativos
#Imprimir frecuencias en formato
for key,value in frec.items(): 
    frec[key]=round((value/num)*100,3)
texto2=texto
frec_español=sorted(frec_español.items(), key=lambda x: x[1], reverse=True)
f.close()
while True:
    os.system('cls||clear')
    print(texto)
    print('\n')
    

    frec_temp = sorted(frec.items(), key=lambda x: x[1], reverse=True)
    
    for x in range(0,20): 
        print('{0}                  {1}'.format(frec_temp[x] , frec_español[x]))
    for x in range(20,23): 
        print(frec_temp[x])
    
    print('\n')
    print("Las letras mayusculas seran las letras originales y las minusculas las reemplazadas")
    print("Los numeros no se veran afectados")
    print('\n')
    print("Introduce -1 en la cualquiera para salir ")
    L1 = input("Itroduce la letra que se va a cambiar en el texto (Importa que sea mayuscula o minuscula) :  ")
    if L1 == "-1": exit()
    L2 = input("Itroduce la letra por la que que se va a reemplazar (Importa que sea mayuscula o minuscula):  ")
    if L2 == "-1": exit()
    
    texto2=texto2.replace(L1.upper(),L2)
    os.system('cls||clear')
    print(texto2)
    r=input("Quieres guardar el cambio? [s/n]")   
    if r == 's':
        texto=texto2
        frec[L2] = frec[L1.upper()]
        del frec[L1.upper()]
        print("Cambio confirmado")
    else:
        print("Cambio CANCELADO")