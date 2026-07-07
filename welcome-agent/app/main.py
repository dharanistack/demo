"""HTTP API for the multilingual welcome agent."""

from __future__ import annotations

import os
from typing import Optional

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

from .agent import build_client, generate_greeting

app = FastAPI(title="Multilingual Welcome Agent")

_client = None


def get_client():
    global _client
    if _client is None:
        if not (os.environ.get("ANTHROPIC_API_KEY") or os.environ.get("ANTHROPIC_AUTH_TOKEN")):
            raise HTTPException(
                status_code=500,
                detail="ANTHROPIC_API_KEY (or ANTHROPIC_AUTH_TOKEN) is not configured",
            )
        _client = build_client()
    return _client


class GreetRequest(BaseModel):
    name: Optional[str] = None
    language: Optional[str] = None
    context: Optional[str] = None


class GreetResponse(BaseModel):
    greeting: str


@app.get("/health")
def health():
    return {"status": "ok"}


@app.post("/greet", response_model=GreetResponse)
def greet(req: GreetRequest):
    client = get_client()
    try:
        greeting = generate_greeting(client, req.name, req.language, req.context)
    except Exception as exc:
        raise HTTPException(status_code=502, detail=str(exc)) from exc
    return GreetResponse(greeting=greeting)
