# Multilingual Welcome Agent

A small containerized AI agent that generates warm, culturally appropriate
welcome greetings in any language, powered by the Claude API.

## Build

```sh
docker build -t welcome-agent .
```

## Run

```sh
docker run --rm -p 8000:8000 -e ANTHROPIC_API_KEY=sk-ant-... welcome-agent
```

## Use

```sh
curl -s http://localhost:8000/greet \
  -H "Content-Type: application/json" \
  -d '{"name": "Priya", "language": "Hindi"}'
```

```sh
curl -s http://localhost:8000/greet \
  -H "Content-Type: application/json" \
  -d '{"name": "Carlos", "context": "Hola, estoy interesado en su producto."}'
```

If `language` is omitted, the agent detects the language from `context` and
replies in kind, defaulting to English when it can't tell.

## Run locally without Docker

```sh
pip install -r requirements.txt
export ANTHROPIC_API_KEY=sk-ant-...
uvicorn app.main:app --reload

# or, one-off from the command line:
python -m app.cli --name Alice --language French
```
