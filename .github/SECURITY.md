# Security Policy

## Supported Versions

This repository is a [Homebrew](https://brew.sh/) tap — it ships the formula that installs the [Elnora CLI](https://github.com/Elnora-AI/elnora-cli), not the CLI source itself. Only the latest formula on the default branch is supported; it always points at the newest published CLI release. Older revisions of the formula are not maintained.

| Version | Supported |
| ------- | --------- |
| Latest formula (default branch) | Yes |
| Older commits / forks | No |

Vulnerabilities in the CLI binary itself should be reported against [Elnora-AI/elnora-cli](https://github.com/Elnora-AI/elnora-cli). Report issues with the tap (formula, download URLs, checksums, install flow) here.

## Reporting a Vulnerability

Do not open a public issue for security problems.

- **Email:** security@elnora.ai
- **GitHub:** use [private vulnerability reporting](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability) on this repository (Security → Report a vulnerability).

Include the formula version, your platform and architecture, and reproduction steps. We aim to acknowledge reports within 3 business days and to ship a corrected formula promptly once a fix is confirmed. Please give us a reasonable window to remediate before any public disclosure.

## Data Flow, Secrets, and Trust

This tap handles **no credentials of its own**. It contains only a Homebrew formula (`Formula/elnora.rb`) and a license. Installation does the following, entirely on your machine:

- Downloads a per-platform release tarball from `https://github.com/Elnora-AI/elnora-cli/releases/...` over HTTPS.
- Verifies the download against a **SHA256 checksum pinned in the formula** before extracting. A tampered or truncated download fails the checksum and aborts the install.
- Installs a single `elnora` binary into your Homebrew prefix.

No API keys, OAuth tokens, session cookies, or personal data are read, written, or transmitted by the tap. Authentication happens later, only when you run the installed CLI: `elnora auth login` prompts for an API key (obtained from platform.elnora.ai) and stores it in the CLI's own local config — that flow, and any calls to the Elnora platform, live in the [elnora-cli](https://github.com/Elnora-AI/elnora-cli) repository and are covered by its security policy. The only network endpoints this tap touches are GitHub Releases (binary download) and the GitHub tag page (Homebrew `livecheck` for version discovery).

The integrity of an install therefore rests on: (1) HTTPS transport to GitHub, and (2) the SHA256 pins in the formula matching the published release artifacts. Both are verifiable in `Formula/elnora.rb`.

## Secrets and PII

No secrets, API keys, or personal data are committed to this repository, and none should be. The formula references only public release URLs and their published checksums. If you believe a secret has been committed, report it via the channels above.
