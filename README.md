


1       2     4     8     5    10
1       0     0     0     1    0
0.08   -0.09 -0.09 -0.09 0.08 -0.09 

Descripción del Proyecto
Este proyecto es una aplicación  que calcula y visualiza el Conjunto de Julia. Utiliza C++ para realizar los cálculos matemáticos  y Gnuplot para transformar esos datos numéricos en una representación gráfica visual en formato PNG.

Instrucciones para ejecutar el código
Para compilar y ejecutar se rerquiere tener instalado g++, gnuplot y un visualizador de imágenes. Luego, desde la terminal, escribe el siguiente comando para compilar:
    make

Detalles de funcionamiento y uso


El código fuente en main.cpp se compila usando C++23 generando un ejecutable llamado julia.

Generación de Datos: Al ejecutar el programa, este calcula las iteraciones del fractal y guarda los resultados en el archivo de texto julia_set.txt

Renderizado Visual: El comando gnuplot toma el script de configuración julia_set.gp y procesa los datos del archivo de texto para generar una imagen julia_set.png. Finalmente, el sistema abre automáticamente esta imagen para mostrar el fractal generado.


# Variables 
CXX = g++                       //Usa g++ como compilador usando la versión mas nueva 
CXXFLAGS = -std=c++23 -O3           

GP = julia_set.gp               //Define el nombre del script de Gnuplot
TXT = $(GP:.gp=.txt)            //Lo que tenga GP, lo convierte a .txt y .png
PNG = $(GP:.gp=.png)

SRCS = main.cpp                 //Código fuente

OBJS = $(SRCS:.cpp=.o)          //Convierte main.cpp a main.o

APP  = julia                    //Nombre del programa

## TARGETS

all: run plot open              //ejecuta las tareas en el orden que estan escritos

.PHONY: vars
vars:                               //.PHONY indica que son comandos y var imprime el valor de las variables
	@echo "print variables"
	@echo "SRCS = $(SRCS)"
	@echo "OBJS = $(OBJS)"
	@echo "PRE  = $<"
	@echo "NAME = $@"
	@echo "GP   = $(GP)"
	@echo "TXT  = $(TXT)"

%.o: %.cpp                      //Convierte archivos .cpp a .o
	@echo "Compiling"
	$(CXX) $(CXXFLAGS) -c $< -o $@     //$< indica el archivo de entrada y $@ es el nombre del objetivo, -c solo compila.

$(APP): $(OBJS)                 //Aqui se enlazan todos los codigos para formar el programa completo
	@echo "Linking"         
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(APP)

run: $(APP)
	@echo "RUN"             //Revisa quw $(APP) este actualizado para ejecutarlo
	./$(APP)

plot: $(TXT)
	@echo "Plot"            //LLama a gnuplot para procesar el script .gp y crear la imagen
	gnuplot $(GP)

open:
	@echo "Open"
	xdg-open $(PNG) &       //usa xdg-open para abrir la iamgen

clean: 
	rm *.o $(APP) *.txt *.png    //Borra todos los archivos generados para empezar desde cero.