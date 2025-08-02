from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from models.schema import MedicineRequest
from services.gpt_service import explain_medicine
from services.log_service import log_request

app = FastAPI(title="MediPal AI")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.post("/gpt/explain")
async def gpt_explain(request: MedicineRequest):
    """Return an AI generated explanation for the medicine."""
    log_request(request.medicine)
    explanation = await explain_medicine(request.medicine)
    return {"medicine": request.medicine, "explanation": explanation}

# Placeholder for future routers
# from routers import medicine as medicine_router
# app.include_router(medicine_router.router)
