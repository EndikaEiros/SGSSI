import hashlib
import os, os.path
sol="e5ed313192776744b9b93b1320b5e268"

import os
for filename in os.listdir('datos'):
    if hashlib.md5(open('datos/'+filename,'rb').read()).hexdigest() == sol:
        print("Solucion encontrada, archivo con nombre:" + filename)