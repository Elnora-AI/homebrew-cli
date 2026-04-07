# Homebrew Tap for Elnora CLI

Official [Homebrew](https://brew.sh/) tap for the [Elnora CLI](https://github.com/Elnora-AI/elnora-cli) — an AI-powered bioprotocol optimization tool for researchers.

## Install

```bash
brew install elnora-ai/cli/elnora
```

Or tap first, then install:

```bash
brew tap elnora-ai/cli
brew install elnora
```

## Get started

```bash
elnora auth login        # Set up your API key
elnora projects list     # List your projects
elnora doctor            # Verify everything works
```

Get your API key at [platform.elnora.ai](https://platform.elnora.ai).

## Upgrade

```bash
brew upgrade elnora
```

## Uninstall

```bash
brew uninstall elnora
brew untap elnora-ai/cli
```

## Other installation methods

- **macOS/Linux:** `curl -fsSL https://cli.elnora.ai/install.sh | bash`
- **Windows:** `irm https://cli.elnora.ai/install.ps1 | iex`
- **npm:** `npm install -g @elnora-ai/cli`

## Links

- [Elnora CLI](https://github.com/Elnora-AI/elnora-cli)
- [Elnora Platform](https://platform.elnora.ai)
