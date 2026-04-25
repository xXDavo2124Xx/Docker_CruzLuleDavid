#==============================================================================
# CONFIGURACIÓN DE RUTAS
#==============================================================================
CXX := g++
CXXFLAGS := -std=c++23 -O3 -Wall

SRC_DIR := src
SCRIPT_DIR := scripts
OBJ_DIR := obj
BIN_DIR := bin
OUT_DIR := output

# Aquí corregí los errores de ( ) que tenía tu manual
APP := $(BIN_DIR)/julia
SOURCES := $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS := $(SOURCES:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

GP_SCRIPT := $(SCRIPT_DIR)/julia_set.gp
DATA_FILE := $(OUT_DIR)/julia_set.txt
IMAGE_FILE := $(OUT_DIR)/julia_set.png

#==============================================================================
# REGLAS DE EJECUCIÓN
#==============================================================================
all: prepare $(APP) show_info

.PHONY: all prepare run plot clean show_info

# ¡ATENCIÓN! Las líneas de abajo que empiezan con @ deben tener un TABULADOR al inicio
prepare:
	@mkdir -p $(OBJ_DIR) $(BIN_DIR) $(OUT_DIR) $(SCRIPT_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo " [CC] Compilando: $<"
	@mkdir -p $(dir $@)
	@$(CXX) $(CXXFLAGS) -c $< -o $@

$(APP): $(OBJECTS)
	@echo " [LD] Creando binario: $@"
	@$(CXX) $(CXXFLAGS) $(OBJECTS) -o $@

show_info:
	@echo "-------------------------------------------------------"
	@echo "✅ Proceso Finalizado con exito."
	@echo "📂 Binario: $(APP)"
	@echo "-------------------------------------------------------"

clean:
	@echo " [CLEAN] Borrando carpetas generadas..."
	@rm -rf $(OBJ_DIR) $(BIN_DIR) $(OUT_DIR)