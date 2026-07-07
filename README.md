<div align="center">

<img src="https://raw.githubusercontent.com/alisakkaf/Samsung-Messages-Restorer/main/Screenshot/Perview.jpg" width="750" alt="Samsung Messages Restorer Preview">

# Samsung Messages Restorer 📱💥

A one-click ADB utility to safely restore and fix the stock Samsung Messages app after the forced July 2026 Google Messages migration—without losing any user data.

[![GitHub Release](https://img.shields.io/github/v/release/alisakkaf/Samsung-Messages-Restorer?style=flat-square)](https://github.com/alisakkaf/Samsung-Messages-Restorer/releases)
[![Downloads](https://img.shields.io/github/downloads/alisakkaf/Samsung-Messages-Restorer/latest/total?style=flat-square&color=blue)](https://github.com/alisakkaf/Samsung-Messages-Restorer/releases)
[![GitHub Stars](https://img.shields.io/github/stars/alisakkaf/Samsung-Messages-Restorer?style=flat-square&logo=github&color=gold)](https://github.com/alisakkaf/Samsung-Messages-Restorer/stargazers)
[![Security Status](https://img.shields.io/badge/Security-Verified-success?style=flat-square)](SECURITY.md)
[![License](https://img.shields.io/github/license/alisakkaf/Samsung-Messages-Restorer?style=flat-square)](LICENSE)

---

</div>

---

## 🔍 The Problem (July 2026 Migration)
In July 2026, Samsung pushed an aggressive system update forcing users away from the native **Samsung Messages** app (`com.samsung.android.messaging`) in favor of Google Messages. For many, the stock app was disabled, hidden, or broken, making it difficult to access old chat interfaces.

**Samsung Messages Restorer** uses a smart automated script via Android Debug Bridge (ADB) to bypass this block, compare your active vs. base package versions, bypass the forced restriction, and safely re-enable your stock messaging environment **with 100% data preservation**.

<p align="center">
  <img src="https://raw.githubusercontent.com/alisakkaf/Samsung-Messages-Restorer/main/Screenshot/Samsung_Issue.png" width="350" alt="Forced July 2026 Google Messages Migration Issue">
</p>

---

## 📸 Visual Preview

Here is how the utility looks during detection and execution processes:

| 🔹 Read Device Info | 🔹 Fix Messages Process | 🔹 Main Script |
| :---: | :---: | :---: |
| ![Read Info](https://raw.githubusercontent.com/alisakkaf/Samsung-Messages-Restorer/main/Screenshot/Readinfo.png) | ![Fixing Process](https://raw.githubusercontent.com/alisakkaf/Samsung-Messages-Restorer/main/Screenshot/Fix.png) | ![Main Menu](https://raw.githubusercontent.com/alisakkaf/Samsung-Messages-Restorer/main/Screenshot/Main.png) |

---

## ✨ Features
*   **One-Click Restore:** Run `Fix_Samsung_Messages.bat` and let ADB handle the bypass.
*   **Smart Version Comparison:** Extracts both the hidden factory system base version and the newly pushed carrier/OTA updates to ensure absolute target precision.
*   **Zero Data Loss:** Safely restores package flags without wiping your local SQLite database or SMS/MMS conversation logs.
*   **No Root Required:** Operates completely within safe, official Android user-space shell boundaries.

---

## 🚀 How to Use (Quick Start)

### 1. Prerequisites
*   Enable **USB Debugging** on your Galaxy device (Go to *Settings* > *About Phone* > *Software Information* > Tap *Build Number* 7 times. Go back to *Developer Options* > Toggle *USB Debugging* ON).
*   Download and install official [Google ADB Drivers / Platform Tools](https://developer.android.com/tools/releases/platform-tools).

### 2. Execution
1. Head over to the [Releases Page](https://github.com/alisakkaf/Samsung-Messages-Restorer/releases).
2. Download the latest version of `Fix_Samsung_Messages.bat`.
3. Connect your Samsung device to your PC via a reliable USB cable.
4. Double-click `Fix_Samsung_Messages.bat` to initiate the auto-restore routine.

---

## ⚠️ Safety, Disclaimers & Limitations

> [!WARNING]
> **Data Responsibility:** While this batch utility is specifically engineered to target application package status flags and preserve database integrity, modifying system package behaviors via ADB inherently carries minimal risk. **The author assumes no liability** for lost SMS logs, disrupted sync routines, or carrier-specific RCS dropouts. 
> 
> Always generate a secure, manual backup using **Samsung Smart Switch** or **Google Cloud Backup** before executing any third-party ADB script.

---

---

### 💡 Support the Developer

<div align="center">
  <i>If you find my tools and projects useful, consider supporting my work. Your support helps keep these projects completely free!</i>
</div>

<br>

<div align="center">

| Crypto Asset | Network | Wallet Address (Copy) | Quick Scan |
| :--- | :--- | :--- | :---: |
| ![USDT](https://img.shields.io/badge/USDT-Tether-26A17B?style=for-the-badge&logo=tether&logoColor=white) | **TRC20** | `TYLBeDA5aGNcc3WkVqf3xWPHXmsZzs2p28` | <a href="https://api.qrserver.com/v1/create-qr-code/?size=300x300&margin=10&data=TYLBeDA5aGNcc3WkVqf3xWPHXmsZzs2p28" target="_blank"><img src="https://img.shields.io/badge/Show_QR-Click_Here-black?style=flat-square&logo=qr-code" alt="QR"></a> |
| ![USDT](https://img.shields.io/badge/USDT-Tether-26A17B?style=for-the-badge&logo=tether&logoColor=white) | **BEP20** | `0x67cf27f33c80479ea96372810f9e2ee4c3b095c5` | <a href="https://api.qrserver.com/v1/create-qr-code/?size=300x300&margin=10&data=0x67cf27f33c80479ea96372810f9e2ee4c3b095c5" target="_blank"><img src="https://img.shields.io/badge/Show_QR-Click_Here-black?style=flat-square&logo=qr-code" alt="QR"></a> |
| ![BTC](https://img.shields.io/badge/BTC-Bitcoin-F7931A?style=for-the-badge&logo=bitcoin&logoColor=white) | **Bitcoin** | `bc1q97dr37h37npzarmmrv0tjz2nm50htqc7pfpzj6` | <a href="https://api.qrserver.com/v1/create-qr-code/?size=300x300&margin=10&data=bitcoin:bc1q97dr37h37npzarmmrv0tjz2nm50htqc7pfpzj6" target="_blank"><img src="https://img.shields.io/badge/Show_QR-Click_Here-black?style=flat-square&logo=qr-code" alt="QR"></a> |
| ![ETH](https://img.shields.io/badge/ETH-Ethereum-3C3C3D?style=for-the-badge&logo=ethereum&logoColor=white) | **ERC20** | `0x67cf27f33c80479ea96372810F9e2EE4C3b095C5` | <a href="https://api.qrserver.com/v1/create-qr-code/?size=300x300&margin=10&data=ethereum:0x67cf27f33c80479ea96372810F9e2EE4C3b095C5" target="_blank"><img src="https://img.shields.io/badge/Show_QR-Click_Here-black?style=flat-square&logo=qr-code" alt="QR"></a> |
| ![SOL](https://img.shields.io/badge/SOL-Solana-9945FF?style=for-the-badge&logo=solana&logoColor=white) | **Solana** | `Cbesgr4tvo4T1inNMFe46GSym2qMYjkmofbXFc77rDNK` | <a href="https://api.qrserver.com/v1/create-qr-code/?size=300x300&margin=10&data=solana:Cbesgr4tvo4T1inNMFe46GSym2qMYjkmofbXFc77rDNK" target="_blank"><img src="https://img.shields.io/badge/Show_QR-Click_Here-black?style=flat-square&logo=qr-code" alt="QR"></a> |
| ![USDC](https://img.shields.io/badge/USDC-USD_Coin-2775CA?style=for-the-badge&logo=usd-coin&logoColor=white) | **ERC20** | `0x67cf27f33c80479ea96372810f9e2ee4c3b095c5` | <a href="https://api.qrserver.com/v1/create-qr-code/?size=300x300&margin=10&data=0x67cf27f33c80479ea96372810f9e2ee4c3b095c5" target="_blank"><img src="https://img.shields.io/badge/Show_QR-Click_Here-black?style=flat-square&logo=qr-code" alt="QR"></a> |
| ![USDC](https://img.shields.io/badge/USDC-USD_Coin-2775CA?style=for-the-badge&logo=usd-coin&logoColor=white) | **SPL** | `Cbesgr4tvo4T1inNMFe46GSym2qMYjkmofbXFc77rDNK` | <a href="https://api.qrserver.com/v1/create-qr-code/?size=300x300&margin=10&data=solana:Cbesgr4tvo4T1inNMFe46GSym2qMYjkmofbXFc77rDNK" target="_blank"><img src="https://img.shields.io/badge/Show_QR-Click_Here-black?style=flat-square&logo=qr-code" alt="QR"></a> |
| ![USDC](https://img.shields.io/badge/USDC-USD_Coin-2775CA?style=for-the-badge&logo=usd-coin&logoColor=white) | **BEP20** | `0x67cf27f33c80479ea96372810F9e2EE4C3b095C5` | <a href="https://api.qrserver.com/v1/create-qr-code/?size=300x300&margin=10&data=0x67cf27f33c80479ea96372810F9e2EE4C3b095C5" target="_blank"><img src="https://img.shields.io/badge/Show_QR-Click_Here-black?style=flat-square&logo=qr-code" alt="QR"></a> |

</div>

---
## ⭐ Support & Contribution
If this automated utility successfully saved your chats and brought back your preferred stock messaging experience, please consider giving this repository a **Star (⭐)**! It helps other frustrated Galaxy users find this fix via search index engines.

Feel free to open an **Issue** if you run into syntax blocks or unexpected output results during package detection.
