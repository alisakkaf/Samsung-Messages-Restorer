# Security Policy

## Supported Versions
We only actively support and monitor the latest main branch of this script.

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | ✅ Yes             |
| < 1.0   | ❌ No              |

## Security Guardrails & Data Safety
*   **Local Execution Only:** This script runs 100% locally on your computer. It does NOT send any data, package names, or device serial numbers to external servers.
*   **Official ADB Binaries:** Always ensure you are using official Google ADB binaries to prevent man-in-the-middle exploits.
*   **No Hidden Deletions:** The script does not execute `pm clear` or `pm uninstall` commands automatically without explicit user interaction in the code.

## Reporting a Vulnerability
If you discover any security risks or unexpected behaviors that could compromise device data, please do not open a public issue. Instead, contact the maintainer directly via GitHub profile email.
