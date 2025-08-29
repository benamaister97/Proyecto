# [Economía del ironman] - API de integración de datos
## EAE253B - Economía y Ciencia de Datos

> **Autores:** [Nicolas Bianchi] - [nico.bianchi@uc.cl] | [Martin Benavente] - [mbenaventi@uc.cl]  
> **Profesor:** Carlos Alvarado  
> **Semestre:** 2do semestre 2025  
> **Fecha:** [29/08/25]

---
## **Propuesta detallada del proyecto**

Nuestro proyecto consiste en crear una API llamada “Economía del Ironman”, cuyo objetivo es mostrar y analizar los costos de prepararse y competir en el Ironman 70.3 de Valdivia 2025. La idea es juntar información personal (perfil, horario académico, equipamiento y gastos) con datos económicos reales para entender cómo la inflación y el dólar afectan el presupuesto de un deportista.

Lo que buscamos es responder preguntas concretas, como:
¿Cuánto cuesta entrenar y competir considerando la inflación y el tipo de cambio?
¿Cómo se ajusta el presupuesto mensual cuando los precios suben?
¿Qué impacto tiene el dólar en el costo de zapatillas, bicicletas y accesorios importados?
¿Cómo combinar el horario de clases con los entrenamientos para organizar mejor el tiempo?

## **Datos económicos a analizar**

1) Inflación (IPC mensual del Banco Central de Chile): Para calcular cómo cambian los precios de un año a otro y ajustar los presupuestos a valores actuales.
2) Tipo de cambio USD/CLP: Fundamental porque gran parte del equipamiento deportivo se compra en dólares, y su precio depende directamente del valor del dólar.
3) Presupuesto mensual: Registro de los principales gastos del deportista (nutrición, inscripciones, viajes, gimnasio, equipamiento).
4) Costo total del Ironman 70.3 Valdivia: Incluye inscripción, transporte, alojamiento, alimentación y amortización del equipo usado.

## 📋 **Descripción del Endpoints**

1. **Endpoints Personales:** 

1) GET /api/personal/profile

Propósito: Este endpoint entrega el perfil del atleta, incluyendo datos básicos como nombre, edad, altura, peso y la meta deportiva principal: el Ironman 70.3 Valdivia (2025).
Justificación: Es la base de todo el proyecto, ya que centraliza la información personal esencial que luego se cruzará con datos económicos, de gastos y de entrenamientos. Permite personalizar el análisis económico a la situación real del estudiante-deportista.

2) GET /api/personal/horario

Propósito: Este endpoint entrega el horario académico semanal del estudiante, indicando los días, ramos y horarios de clases.
Justificación: Saber en qué momentos del día existen clases y en cuáles no es fundamental para planificar entrenamientos. Este endpoint conecta la vida académica con la deportiva, mostrando la disponibilidad real de tiempo para nadar, pedalear o correr.

3) GET /api/personal/equipamiento

Propósito: Este endpoint lista el equipamiento deportivo del atleta (running, ciclismo, natación), con marca, modelo y vida útil estimada en kilómetros.
Justificación: El equipamiento es uno de los mayores gastos en el triatlón. Contar con esta información permite proyectar costos futuros (reemplazo de zapatillas, cadenas, ruedas, etc.) y calcular métricas como el costo por kilómetro entrenado, integrando economía con deporte de forma directa.

2. **Endpoints de Integración:**

4) GET /api/finanzas/ipc-mensual

Propósito: Este endpoint tiene la misión de ser nuestro predictor económico. Se encarga de extraer el IPC mensual, una de las métricas de inflación más importantes, directamente de la fuente oficial: el Banco Central de Chile.
Justificación: En un país con volatilidad de precios, un deportista no puede planificar su presupuesto sin considerar el efecto de la inflación. Este endpoint nos permite tener una fuente de datos confiable y actualizada para convertir un presupuesto estático en una herramienta dinámica que refleja la realidad del costo de vida, garantizando que nuestros análisis no estén desactualizados.

5) GET /api/finanzas/usdclp

Propósito: Este endpoint obtiene el valor del tipo de cambio USD/CLP observado en el mercado, conectándose a la API del Banco Central de Chile u otra fuente financiera oficial.
Justificación: Gran parte del equipamiento deportivo (zapatillas, bicicleta, wetsuit, ruedas, etc.) se compra en dólares. Al integrar el tipo de cambio en tiempo real, este endpoint permite proyectar de manera más realista el costo de la preparación y competencia, especialmente cuando el presupuesto depende en un alto porcentaje de bienes importados.

3. **Endpoints de Base de Datos:** 

6) GET /api/db/gastos

Propósito: Este endpoint lista los gastos deportivos almacenados en la base SQL del proyecto (nutrición, inscripción, equipamiento, viajes, gimnasio, etc.). Permite filtrar por mes, año y categoría, y devuelve además un total agregado para facilitar el control presupuestario.
Justificación: Para analizar la Economía del Ironman hace falta una fuente interna y estructurada de costos reales. Este endpoint es la puerta de acceso a esos datos “duros” que luego se combinan con la inflación (IPC) y el tipo de cambio (USD/CLP) en los endpoints analíticos. Sin una capa de gastos persistidos, las proyecciones serían teóricas; con ella, los cálculos reflejan la realidad del atleta y permiten tomar decisiones informadas (ajustes de presupuesto, reemplazo de equipo, búsqueda de auspicio).
     
4. **Endpoints Analíticos:** 

7) GET /api/analisis/presupuesto-ajustado

Propósito: Este endpoint calcula cómo varía el presupuesto deportivo del atleta al ajustarlo por inflación, utilizando el IPC mensual como referencia. Permite comparar un presupuesto base definido en una fecha pasada con su valor actualizado en el presente.
Justificación: En un contexto de inflación, un monto fijo pierde poder adquisitivo con el tiempo. Para un triatleta que debe planificar gastos en suplementos, gimnasio y viajes, este análisis es esencial: transforma un número estático en un presupuesto vivo que refleja el costo real de entrenar y competir hoy.

8) GET /api/analisis/costo-ironman

Propósito: Este endpoint calcula el costo total de competir en un Ironman 70.3, considerando inscripción, viaje, alojamiento, nutrición y la amortización del equipamiento utilizado. La salida incluye el desglose detallado y el valor en CLP y USD.
Justificación: Competir en un Ironman es una inversión significativa. Este endpoint entrega una visión integral del gasto asociado, lo que permite tomar decisiones financieras informadas (buscar auspicios, ajustar el presupuesto, priorizar compras de equipo). Además, conecta los datos personales y externos (IPC, USD/CLP) para proyectar un costo realista de la temporada.


## **Identificación de fuentes de datos y APIs externas a utilizar**

1) Banco Central de Chile (API BDE): Proveerá los datos de IPC mensual y del tipo de cambio USD/CLP. Son indicadores clave para ajustar presupuestos por inflación y para calcular el impacto de la variación del dólar en la compra de equipamiento importado.

2) Mercado Libre (API pública de búsqueda de productos): Permitirá consultar precios de zapatillas, bicicletas y accesorios deportivos. Estos valores servirán de referencia para estimar los costos de reposición de equipamiento.

3) Strava API: Fuente de datos de entrenamiento (kilómetros, sesiones, volumen). Útil para relacionar el uso real del equipamiento con su vida útil y calcular el costo por kilómetro entrenado.


## 🔗 **Detalle de Endpoints Disponibles**

### **1. Endpoints Personales**

#### `GET /api/personal/profile`

**Respuesta:**

```json
{
  "name": "[nombre]",
  "age": 21,
  "height_cm": 181,
  "weight_kg": 75,
  "goal": {
    "event": "IM 70.3 Valdivia",
    "date": "2025-11-30"
  }
}
```

#### `GET /api/personal/horario`

**Respuesta:**

```json
{
  "horario": [
    {
      "dia": "Lunes",
      "ramo": "Microeconomía II",
      "hora_inicio": "08:30",
      "hora_fin": "10:00"
    },
    {
      "dia": "Martes",
      "ramo": "Econometría",
      "hora_inicio": "11:30",
      "hora_fin": "13:00"
    },
    {
      "dia": "Jueves",
      "ramo": "Macroeconomía II",
      "hora_inicio": "15:00",
      "hora_fin": "16:30"
    }
  ],
  "comentario": "Espacios libres martes y jueves en la mañana ideales para entrenar ciclismo y natación."
}
```

#### `GET /api/personal/equipamiento`

**Respuesta:**

```json
{
  "run": [
    {
      "brand": "Nike",
      "model": "Zoomfly 6",
      "expected_life_km": 600
    }
  ],
  "bike": [
    {
      "brand": "SCott",
      "model": "foil 20",
      "expected_life_km": 30000
    }
  ],
  "swim": [
    {
      "brand": "Arena",
      "model": "Cobra Ultra",
      "expected_life_km": 2000
    }
  ]
}
```

### **2. Endpoints de Integración con APIs Externas**

#### `GET /api/finanzas/ipc-mensual`

**Respuesta:**
```json
{
  "series": [
    {
      "date": "2025-06-01",
      "ipc_var_mensual": 0.3
    },
    {
      "date": "2025-07-01",
      "ipc_var_mensual": 0.2
    }
  ],
  "fuente": "Banco Central de Chile"
}
```

#### `GET /api/finanzas/usdclp`

**Respuesta:**
```json
{
  "pair": "USD/CLP",
  "rates": [
    {
      "date": "2025-07-31",
      "value": 982.5
    },
    {
      "date": "2025-08-01",
      "value": 985.7
    }
  ],
  "fuente": "Banco Central de Chile"
}
```

### **3. Endpoints de Base de Datos (CRUD)**

#### `GET /api/db/gastos`

**Respuesta:**
```json
{
  "results": [
    {
      "date": "2025-07-10",
      "category": "equipamiento",
      "description": "Zapatillas Nike Zoomfly 6",
      "amount": 149990,
      "currency": "CLP"
    },
    {
      "date": "2025-07-15",
      "category": "nutricion",
      "description": "Geles energéticos",
      "amount": 25000,
      "currency": "CLP"
    }
  ],
  "total_clp": 174990
}
```

### **4. Endpoints Analíticos**

#### `GET /api/analisis/presupuesto-ajustado`

**Respuesta:**
```json
{
  "coef": 1.042,
  "budget_base": 850000,
  "budget_ajustado": 885700,
  "comentario": "El presupuesto original ha perdido 4.2% de poder adquisitivo."
}
```

#### `GET /api/analisis/costo-ironman`

**Respuesta:**
```json
{
  "clp": 1450000,
  "usd": 1480,
  "detalle": {
    "inscripcion": 380000,
    "viaje": 220000,
    "alojamiento": 300000,
    "nutricion": 120000,
    "amortizacion_gear": 430000
  },
  "comentario": "Se recomienda buscar auspicio para cubrir al menos el 30% del costo total."
}
```