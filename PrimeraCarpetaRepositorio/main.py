from fastapi import FastAPI

app = FastAPI()

@app.get("/api/personal/profile")
def profile():
    return {
        "name": "Tu Nombre",
        "age": 21,
        "height_cm": 181,
        "weight_kg": 75.0,
        "goal": {
            "event": "Ironman 70.3 Valdivia",
            "date": "2025-11-30",
            "city": "Valdivia",
            "country": "CL"
        }
    }
