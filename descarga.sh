#!/bin/bash

# Script para clonar y configurar proyecto Django
# Uso: ./setup_project.sh

set -e  # Detener ejecución ante cualquier error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuración
PROJECT_NAME="Aplicacion-de-Encuestas-con-Django"
REPO_URL="https://github.com/tu_usuario/tu_repositorio.git"  
TARGET_DIR="$HOME/Desktop/$PROJECT_NAME"  

echo -e "${GREEN}=== Configuración de Proyecto Django ===${NC}\n"

# Verificar si ya existe el directorio
if [ -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}⚠️  El directorio $TARGET_DIR ya existe.${NC}"
    read -p "¿Deseas borrarlo y empezar de nuevo? (s/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        echo "Eliminando directorio existente..."
        rm -rf "$TARGET_DIR"
    else
        echo -e "${RED}✗ Operación cancelada.${NC}"
        exit 1
    fi
fi

# Clonar repositorio
echo -e "${GREEN}1. Clonando repositorio...${NC}"
if ! git clone "$REPO_URL" "$TARGET_DIR" 2>/dev/null; then
    echo -e "${RED}✗ Error al clonar el repositorio.${NC}"
    echo "Verifica:"
    echo "  - Que la URL sea correcta: $REPO_URL"
    echo "  - Que tengas acceso a internet"
    echo "  - Que el repositorio exista"
    exit 1
fi

cd "$TARGET_DIR" || exit

# Verificar si es un proyecto Django
if [ ! -f "manage.py" ]; then
    echo -e "${YELLOW}⚠️  No se encontró manage.py. ¿Es un proyecto Django?${NC}"
fi

# Crear entorno virtual
echo -e "\n${GREEN}2. Creando entorno virtual...${NC}"
if ! python3 -m venv venv 2>/dev/null; then
    echo -e "${RED}✗ Error al crear entorno virtual.${NC}"
    echo "Instala virtualenv: sudo apt install python3-venv"
    exit 1
fi

# Activar entorno virtual
echo -e "\n${GREEN}3. Activando entorno virtual...${NC}"
source venv/bin/activate

# Verificar que se activó
if [ -z "$VIRTUAL_ENV" ]; then
    echo -e "${RED}✗ No se pudo activar el entorno virtual.${NC}"
    exit 1
fi
echo -e "✓ Entorno virtual activado: $(which python)"

# Actualizar pip
echo -e "\n${GREEN}4. Actualizando pip...${NC}"
pip install --upgrade pip

# Instalar dependencias
echo -e "\n${GREEN}5. Instalando dependencias...${NC}"
if [ -f "requirements.txt" ]; then
    echo "Instalando desde requirements.txt..."
    pip install -r requirements.txt
elif [ -f "pyproject.toml" ]; then
    echo "Instalando desde pyproject.toml..."
    pip install .
else
    echo "Instalando Django por defecto..."
    pip install django psycopg2-binary python-dotenv  # Dependencias comunes
fi

# Crear .env si no existe
if [ ! -f ".env" ] && [ -f ".env.example" ]; then
    echo -e "\n${GREEN}6. Creando archivo .env...${NC}"
    cp .env.example .env
    echo -e "${YELLOW}⚠️  IMPORTANTE: Edita el archivo .env con tus credenciales${NC}"
fi

# Verificar instalación
echo -e "\n${GREEN}7. Verificando instalación...${NC}"
if python -c "import django; print(f'✓ Django {django.__version__} instalado')"; then
    echo "✓ Todas las dependencias instaladas correctamente"
else
    echo -e "${RED}✗ Django no se instaló correctamente.${NC}"
    exit 1
fi

# Instrucciones finales
echo -e "\n${GREEN}✅ ¡Proyecto configurado exitosamente!${NC}"
echo -e "\n${YELLOW}=== INSTRUCCIONES ===${NC}"
echo "1. Para activar el entorno virtual:"
echo "   cd $TARGET_DIR && source venv/bin/activate"
echo ""
echo "2. Configurar base de datos:"
echo "   python manage.py migrate"
echo ""
echo "3. Crear superusuario:"
echo "   python manage.py createsuperuser"
echo ""
echo "4. Ejecutar servidor:"
echo "   python manage.py runserver"
echo ""
echo "5. Acceder en el navegador:"
echo "   http://127.0.0.1:8000"
echo "   http://127.0.0.1:8000/admin"
echo ""
echo -e "${GREEN}¡Listo para desarrollar! 🚀${NC}"