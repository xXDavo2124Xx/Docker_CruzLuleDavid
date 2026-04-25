Proyecto : Gestión de Procesos
Innovación Técnica: Multi-stage Build
A diferencia del primer proyecto, este ejercicio utiliza una construcción de etapas múltiples para optimizar recursos:

1.  **Etapa de Compilación:** Se utiliza una imagen completa de `GCC` para compilar el código fuente.
2.  **Etapa de Producción:** El binario resultante se traslada a una imagen `debian-slim`. 
    * **Resultado:** Una imagen final extremadamente ligera que contiene únicamente el ejecutable, eliminando el peso innecesario del compilador y herramientas de desarrollo en el despliegue final.

Conceptos de Sistemas Operativos Demostrados
* **Llamada `fork()`:** Creación de procesos hijos mediante la duplicación del espacio de direcciones del padre.
* **Aislamiento de Memoria:** Demostración de que cada proceso mantiene su propia copia de las variables globales (`int I`).
* **Jerarquía y PIDs:** Seguimiento de identificadores de procesos. En este entorno, el proceso padre adquiere el **PID 1**, demostrando el aislamiento del espacio de nombres de Docker.
* **Sincronización:** Uso de `wait()` para que el padre recolecte los estados de salida de los hijos, evitando procesos "zombie".

Instrucciones de Ejecución

1.  **Navegar a la carpeta del ejercicio:**
    En powershell
    cd docker-procesos
    

2.  **Construir la imagen optimizada:**
    En powershell
    docker build -t ejercicio_procesos .
    

3.  **Ejecutar el laboratorio de procesos:**
    En powershell
    docker run -ti --rm ejercicio_procesos
    


Al ejecutar el contenedor, se observará en la terminal:
* La identificación del Padre con su PID y PPID.
* La ejecución de múltiples hijos imprimiendo valores incrementales de sus variables locales.
* Una pausa controlada de 20 segundos antes de la terminación total del programa, permitiendo inspeccionar el estado de los procesos en ejecución.