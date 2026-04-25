# Proyecto: Visualización del Conjunto de Julia con Docker


Este proyecto implementa un generador de fractales basado en el Conjunto de Julia, utilizando un entorno de contenedores para garantizar la portabilidad y la correcta graficación de los resultados matemáticos.
El conjunto de Julia es un fractal definido por el comportamiento de una función compleja al ser iterada. 
donde se evalúa la convergencia de cada punto en el plano complejo para asignar un valor cromático basado en la velocidad de escape.

Tecnologías y Herramientas
* **Lenguaje:** C++ (Estándar 11 o superior).
* **Entorno de Compilación:** GCC mediante Docker.
* **Graficación:** Gnuplot (integrado en el contenedor).
* **Automatización:** Makefile para la compilación y limpieza de binarios.



Instrucciones de Uso

Para ejecutar este laboratorio, asegúrate de tener Docker Desktop iniciado y sigue estos pasos en tu terminal:

1. **Construir la imagen:**
   ```bash
   docker build -t ambiente_c_mas_mas .