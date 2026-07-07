"""Core logic for the multilingual welcome agent."""

from __future__ import annotations

from typing import Optional

from anthropic import Anthropic

MODEL = "claude-opus-4-8"

SYSTEM_PROMPT = """You are Aiden, a warm and courteous multilingual welcome agent for a product or website.

Your only job is to greet visitors with a short welcome message in the language they ask for.

Rules:
- Keep the greeting brief: 1-3 sentences.
- Match the tone, formality, and cultural etiquette customary for that language and culture.
- If a name is given, address the visitor by name.
- If a target language is given (by name or ISO code), respond only in that language.
- If no target language is given, detect the language of the visitor's own message and reply in that language; default to English if it can't be determined.
- Respond only with the greeting itself - no translations, no explanations, no extra commentary.
- If the requested language is unsupported or ambiguous, greet in English and briefly say so.
"""


def build_client() -> Anthropic:
    """Create an Anthropic client. Picks up ANTHROPIC_API_KEY / ANTHROPIC_AUTH_TOKEN
    or an `ant auth login` profile from the environment automatically."""
    return Anthropic()


def generate_greeting(
    client: Anthropic,
    name: Optional[str] = None,
    language: Optional[str] = None,
    context: Optional[str] = None,
) -> str:
    """Generate a welcome greeting for a visitor.

    Args:
        client: An initialized Anthropic client.
        name: The visitor's name, if known.
        language: The target language (name or ISO code), if known.
        context: A free-text message from the visitor, used to detect the
            language when `language` is not provided, or to tailor the tone.
    """
    lines = []
    if language:
        lines.append(f"Target language: {language}")
    else:
        lines.append(
            "Target language: not specified - detect it from the visitor "
            "message below; default to English if unclear."
        )
    if name:
        lines.append(f"Visitor name: {name}")
    if context:
        lines.append(f"Visitor message: {context}")
    if len(lines) == 1 and not language:
        lines.append("Visitor message: (none provided)")

    user_message = "\n".join(lines)

    response = client.messages.create(
        model=MODEL,
        max_tokens=300,
        system=SYSTEM_PROMPT,
        output_config={"effort": "low"},
        messages=[{"role": "user", "content": user_message}],
    )

    for block in response.content:
        if block.type == "text":
            return block.text.strip()
    return ""
