from fastapi import APIRouter

router = APIRouter(prefix="/medicine", tags=["medicine"])


@router.get("/")
async def list_medicines():
    """Placeholder endpoint for listing medicines."""
    return []
