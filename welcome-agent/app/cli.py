"""CLI entrypoint for the multilingual welcome agent."""

from __future__ import annotations

import argparse

from .agent import build_client, generate_greeting


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate a multilingual welcome greeting")
    parser.add_argument("--name", help="Visitor's name")
    parser.add_argument("--language", help="Target language (name or ISO code)")
    parser.add_argument("--context", help="Visitor's message, for tone or language detection")
    args = parser.parse_args()

    client = build_client()
    greeting = generate_greeting(client, args.name, args.language, args.context)
    print(greeting)


if __name__ == "__main__":
    main()
