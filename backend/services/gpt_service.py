import os
from dotenv import load_dotenv
import openai

load_dotenv()
openai.api_key = os.getenv("OPENAI_API_KEY")


async def explain_medicine(medicine: str) -> str:
    """Use OpenAI to generate an explanation for the medicine."""
    response = await openai.ChatCompletion.acreate(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": "You are a helpful medical assistant."},
            {
                "role": "user",
                "content": f"Explain the medicine {medicine} in simple terms.",
            },
        ],
        max_tokens=100,
    )
    return response["choices"][0]["message"]["content"].strip()
