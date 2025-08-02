from pydantic import BaseModel


class MedicineRequest(BaseModel):
    medicine: str
