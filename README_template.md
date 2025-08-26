# [NOMBRE DEL PROYECTO] - API de integración de datos
## EAE253B - Economía y Ciencia de Datos

> **Autores:** [Nicolás Bianchi] - [Nico.bianchi@uc.cl] | [Nombre Estudiante 2] - [email]  
> **Profesor:** Carlos Alvarado  
> **Semestre:** 2do semestre 2025  
> **Fecha:** [Fecha de entrega final]

---

## 📋 **Descripción del Endpoints**

[Describe en 2-3 párrafos qué hace tu API y qué datos económico/financiero puede mostrar. Ejemplo:]

Esta API permite obtener y manejar información sobre distintas fuentes de datos, tanto información propia como otra información generada por fuentes externas. 

1. **Endpoints Personales:** 
    - datos sobre ramos cursados y sus notas
    - datos sobre desempeño en competencias deportivas

2. **Endpoints de Integración:** Deberán entregar información de fuentes externas, como páginas web u otras APIs, para obtener datos económicos y/o financieros
    - datos sobre inflación en Chile (fuente: API Banco Central)
    - datos sobre precios de propiedades en Providencia (fuente: webscraping de portalinmobiliario)

3. **Endpoints de Base de Datos:** 
    - datos sobre fondos mutuos en Chile
     
4. **Endpoints Analíticos:** 


---

## 🚀 **Instalación y Configuración**

### **Requisitos Previos**
- Python 3.12+
- Conda o pip
- [Otros requisitos específicos]

### **1. Clonar el Repositorio**
```bash
git clone https://github.com/[tu-usuario]/[nombre-repo].git
cd [nombre-repo]
```

### **2. Crear Ambiente Virtual**
```bash
# Usando conda
conda env create -f environment.yml
conda activate [nombre-ambiente]

# O usando pip
pip install -r requirements.txt
```

### **3. Configuración de Variables de Entorno**
```bash
# Crear archivo .env en la raíz del proyecto
cp .env.example .env

# Editar .env con tus credenciales:
# API_KEY_BANCO_CENTRAL=tu_api_key_aqui
# DATABASE_URL=sqlite:///./database.db
```

### **4. Inicializar Base de Datos**
```bash
python scripts/init_db.py
```

### **5. Ejecutar la API**
```bash
uvicorn main:app --reload
```

La API estará disponible en: `http://localhost:8000`

---

## 📚 **Estructura del Proyecto**

```
proyecto/
│
├── main.py                 # Archivo principal de FastAPI
├── requirements.txt        # Dependencias pip
├── environment.yml         # Ambiente conda
├── .env.example           # Ejemplo de variables de entorno
├── README.md              # Este archivo
│
├── app/
│   ├── __init__.py
│   ├── models.py          # Modelos de base de datos
│   ├── database.py        # Configuración de BD
│   ├── routers/           # Endpoints organizados
│   │   ├── personal.py    # Endpoints personales
│   │   ├── economic.py    # Endpoints económicos
│   │   ├── database.py    # Endpoints CRUD
│   │   └── analytics.py   # Endpoints analíticos
│   └── utils/
│       ├── external_apis.py   # Funciones para APIs externas
│       └── calculations.py    # Cálculos económicos
│
├── data/
│   ├── raw/               # Datos originales
│   ├── processed/         # Datos procesados
│   └── database.db        # Base de datos SQLite
│
├── scripts/
│   ├── init_db.py         # Inicializar base de datos
│   └── load_data.py       # Cargar datos iniciales
│
├── tests/
│   ├── test_endpoints.py  # Tests de endpoints
│   └── test_utils.py      # Tests de utilidades
│
└── docs/
    ├── api_documentation.md   # Documentación detallada
    └── video_demo_link.md     # Link al video demo
```

---

## 🔗 **Detalle de Endpoints Disponibles**

### **Documentación Interactiva**
- **Swagger UI:** http://localhost:8000/docs
- **ReDoc:** http://localhost:8000/redoc

### **1. Endpoints Personales**

#### `GET /api/personal/familia`
Información familiar básica.

**Respuesta:**
```json
{
  "integrantes": 4,
  "ingresos_mensuales": 2500000,
  "region": "Metropolitana"
}
```

#### `GET /api/personal/academico`
Historial académico universitario.

#### `GET /api/personal/intereses`
Áreas de interés y hobbies.

### **2. Endpoints de Integración con APIs Externas**

#### `GET /api/economia/inflacion/{periodo}`
Datos de inflación del Banco Central.

**Parámetros:**
- `periodo`: Año o rango de fechas (ej: "2024" o "2023-2024")

**Respuesta:**
```json
{
  "periodo": "2024",
  "inflacion_anual": 4.2,
  "fuente": "Banco Central de Chile",
  "fecha_consulta": "2024-11-21"
}
```

#### `GET /api/internacional/gdp/{paises}`
PIB per cápita de países (World Bank API).

### **3. Endpoints de Base de Datos (CRUD)**

#### `POST /api/db/gastos`
Crear nuevo registro de gasto.

#### `GET /api/db/gastos/{id}`
Obtener gasto específico.

#### `PUT /api/db/gastos/{id}`
Actualizar gasto existente.

#### `DELETE /api/db/gastos/{id}`
Eliminar gasto.

### **4. Endpoints Analíticos**

#### `GET /api/analytics/impacto-inflacion`
Análisis del impacto inflacionario en gastos familiares.

**Respuesta:**
```json
{
  "analisis": {
    "inflacion_actual": 4.2,
    "impacto_gastos": {
      "alimentacion": "Alto impacto (+12%)",
      "transporte": "Medio impacto (+6%)"
    },
    "recomendaciones": [
      "Ajustar presupuesto alimentación en 15%",
      "Considerar alternativas de transporte"
    ]
  }
}
```

---

## 💾 **Base de Datos**

### **Esquema de Datos**

```sql
-- Tabla de gastos familiares
CREATE TABLE gastos (
    id INTEGER PRIMARY KEY,
    fecha DATE,
    categoria VARCHAR(50),
    monto DECIMAL(10,2),
    descripcion TEXT
);

-- Tabla de datos macroeconómicos
CREATE TABLE indicadores (
    id INTEGER PRIMARY KEY,
    indicador VARCHAR(50),
    fecha DATE,
    valor DECIMAL(10,4),
    fuente VARCHAR(100)
);
```

### **Datos de Ejemplo**
La base de datos incluye:
- [X] registros de gastos familiares (2023-2024)
- [X] datos históricos de inflación
- [X] información de tasas de interés
- [X] [otros datos relevantes]


---

## 🎥 **Video Demostración**

**Link:** [URL del video de demostración (3-5 minutos)]

**Contenido del video:**
- Demostración de endpoints principales
- Explicación del problema económico
- Walkthrough de resultados analíticos
- Conclusiones y valor agregado

---

## 🔧 **Tecnologías Utilizadas**

### **Backend**
- **FastAPI:** Framework web para la API
- **SQLite:** Base de datos
- **SQLModel:** ORM para manejo de datos
- **Pandas:** Análisis y manipulación de datos

### **APIs Externas**
- **Banco Central de Chile API:** Datos macroeconómicos
- **World Bank API:** Datos internacionales
- **[Otras APIs utilizadas]**

### **Herramientas de Desarrollo**
- **Python 3.9+**
- **Jupyter Notebooks:** Análisis exploratorio
- **pytest:** Testing
- **Git/GitHub:** Control de versiones

---

## 📈 **Próximos Pasos y Mejoras**

### **Funcionalidades Futuras**
- [ ] [Mejora propuesta 1]
- [ ] [Mejora propuesta 2]
- [ ] [Mejora propuesta 3]

### **Optimizaciones Técnicas**
- [ ] Implementar cache para APIs externas
- [ ] Agregar autenticación de usuarios
- [ ] Mejorar performance de consultas SQL
- [ ] Implementar logging avanzado

---

## 👥 **Contribuciones**

### **División del Trabajo**
- **[Nombre 1]:** [Descripción de responsabilidades]
- **[Nombre 2]:** [Descripción de responsabilidades]

### **Metodología de Trabajo**
[Describe cómo organizaron el trabajo, herramientas de colaboración utilizadas, etc.]

---

## 📝 **Licencia**

Este proyecto fue desarrollado como parte del curso EAE253B - Economía y Ciencia de Datos de la Pontificia Universidad Católica de Chile.

---

## 📞 **Contacto**

**Estudiante 1:** [nombre] - [email]  
**Estudiante 2:** [nombre] - [email]  
**Profesor:** Carlos Alvarado - cealvara@uc.cl  

**Repositorio:** https://github.com/[usuario]/[repo]  
**Documentación adicional:** [links relevantes]

---

## 🙏 **Agradecimientos**

- Profesor Carlos Alvarado y ayudantes del curso EAE253B
- [Otras personas o recursos que ayudaron]
- Fuentes de datos utilizadas (Banco Central, World Bank, etc.)

---

*Última actualización: [Fecha]*
