# Polls App – Django

Este proyecto es mi **primer proyecto desarrollado con Django**, siguiendo la **documentación oficial de Django** y adaptado con mejoras propias.

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

Instalación y ejecución

    Clonar el repositorio:

git clone https://github.com/MonacoSimon/Aplicacion-de-Encuestas-con-Django.git
cd Aplicacion-de-Encuestas-con-Django

    Crear y activar un entorno virtual:

    En Linux/macOS:

python3 -m venv venv
source venv/bin/activate

    En Windows (PowerShell):

python -m venv venv
venv\Scripts\Activate.ps1

    Instalar dependencias:

pip install --upgrade pip
pip install -r requirements.txt

    Configurar la base de datos (opcional, solo si usás PostgreSQL). Editar mysite/settings.py:

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

Si usás SQLite, no es necesario modificar nada.

    Aplicar migraciones:

python manage.py migrate

    Crear un superusuario (opcional, para acceder al panel de administración):

python manage.py createsuperuser

    Ejecutar el servidor de desarrollo:

python manage.py runserver

    Abrir la aplicación en el navegador:

http://127.0.0.1:8000/

Uso

    Acceder a la página principal para ver las encuestas disponibles.

    Hacer clic en una encuesta para ver las opciones de votación.

    Votar y consultar los resultados en tiempo real.

    Administrar preguntas y opciones desde el panel de administración de Django (/admin).

Notas

    Este proyecto utiliza Bootstrap 5 mediante CDN para estilos rápidos y responsivos.

    Todo el desarrollo se realizó dentro de un entorno virtual para mantener las dependencias aisladas.

    La aplicación sirve como ejemplo para comprender el flujo MVT de Django, la gestión de modelos y la integración de frontend y backend.
