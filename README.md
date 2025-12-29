# Polls App – Django

Este proyecto es mi **primer proyecto desarrollado con Django**, realizado siguiendo la **documentación oficial de Django** y adaptado con mejoras propias.

La aplicación implementa un sistema básico de **encuestas (polls)**, utilizando:
- Django (backend)
- Bootstrap (frontend)
- Entorno virtual de Python
- Base de datos relacional gestionada por Django

Documentación oficial de Django:  
https://www.djangoproject.com/

---

## Descripción del proyecto

La aplicación permite:

- Listar preguntas (encuestas)
- Ver el detalle de cada pregunta
- Votar opciones
- Ver resultados
- Administrar contenido desde el panel de administración de Django

El objetivo principal del proyecto es **aprender la arquitectura de Django**, el flujo MVT (Model–View–Template) y las buenas prácticas iniciales para proyectos web.

---

## Tecnologías utilizadas

- Python 3.12
- Django
- Bootstrap 5 (CDN)
- HTML / CSS
- SQLite o PostgreSQL
- Entorno virtual (venv)

---

## Requisitos previos

Antes de comenzar, asegurarse de tener instalado:

- Python 3.10 o superior
- pip
- Git (opcional)

Verificar versiones:

```bash
python --version
pip --version

### 1. Clonar el repositorio y usar el script de descarga

```bash
git clone https://github.com/MonacoSimon/Aplicacion-de-Encuestas-con-Django.git
cd Aplicacion-de-Encuestas-con-Django
#crear entorno virtual
python3 -m venv venv
source venv/bin/activate
# en windows
venv\Scripts\Activate.ps1
#instalar dependencias
pip install --upgrade pip
pip install -r requirements.txt

#crear base de datos si usa postgresql, si usa sqlite no hacer nada
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'nombre_db',
        'USER': 'usuario',
        'PASSWORD': 'contraseña',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}


#aplicar migraciones
python manage.py migrate
#crear superusuario
python manage.py createsuperuser

# ejecutar el servidor
python manage.py runserver
abir la url en el navegador http://127.0.0.1:8000/



