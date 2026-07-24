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

## 🔍 The Problem & Modern One UI Shift

In July 2026, Samsung pushed an aggressive system update forcing users away from the native **Samsung Messages** app (`com.samsung.android.messaging`) in favor of Google Messages. For many users, the stock app was disabled, hidden, or broken, making it difficult to access original chat interfaces.

### 💡 Why Did Samsung Messages Become Removable on Modern Devices (S25 Series / One UI 8.5 & 9 BETA)?

On recent flagship devices (such as the **Galaxy S25 series** running **One UI 8.5 & 9 BETA**), Samsung fundamentally shifted its system application architecture:

1. **Defaulting to Google Messages**: Samsung adopted Google Messages as the default out-of-the-box SMS/MMS client across globally shipped firmware, demoting Samsung Messages to an optional secondary app.
2. **Transition from `/system/priv-app/` to Removable App**: To accommodate this change, recent updates removed Samsung Messages from the protected `/system/priv-app/` directory and moved it to removable partitions (such as `/product/app` or `/system/app`), converting it into a pre-installed app that can be uninstalled completely—just like any app downloaded from the Google Play Store.
3. **Summary**: Changing the package installation path and privilege tier in recent updates allowed users to uninstall the app with a single click (whereas the legacy `/system/priv-app/` location previously strictly blocked uninstallation). This architectural shift makes automated APK restoration significantly easier and safer.

<p align="center">
  <img src="https://raw.githubusercontent.com/alisakkaf/Samsung-Messages-Restorer/main/Screenshot/Samsung_Issue.png" width="350" alt="Forced July 2026 Google Messages Migration Issue">
</p>

---

> [!NOTE]
> 🟣 **Direct Official APK Mirrors for Manual Recovery:**
> 
> If Samsung Messages was completely purged from your device, you can grab the official release APK matching your Android version below:
> - 📱 **Android 10 – 14**: [Download Samsung Messages v14.7.90.101 APK](https://www.apkmirror.com/apk/samsung-electronics-co-ltd/samsung-messages/samsung-messages-14-7-90-101-release/samsung-messages-14-7-90-101-android-apk-download/)
> - ⚡ **Android 15 – 16 (One UI 8.5 & 9 BETA / S25 Series)**: [Download Samsung Messages v16.2.02.6 APK](https://www.apkmirror.com/apk/samsung-electronics-co-ltd/samsung-messages/samsung-messages-16-2-02-6-release/samsung-messages-16-2-02-6-android-apk-download/)

---

## 📸 Visual Preview

Here is how the utility looks during detection and execution processes:

| 🔹 Read Device Info | 🔹 Fix Messages Process | 🔹 Main Script |
| :---: | :---: | :---: |
| ![Read Info](https://raw.githubusercontent.com/alisakkaf/Samsung-Messages-Restorer/main/Screenshot/Readinfo.png) | ![Fixing Process](https://raw.githubusercontent.com/alisakkaf/Samsung-Messages-Restorer/main/Screenshot/Fix.png) | ![Main Menu](https://raw.githubusercontent.com/alisakkaf/Samsung-Messages-Restorer/main/Screenshot/Main.png) |

---

## ✨ Key Features & Technical Capabilities

*   **One-Click Automated Restore:** Run `Fix_Samsung_Messages.bat` and let ADB handle the full rollback, permission restoration, and app restriction setup.
*   **Smart Version & Package Detection:** Automatically extracts active vs. base package versions and verifies whether `com.samsung.android.messaging` is installed for User 0.
*   **Dynamic Android Version Detection:** Automatically detects whether your device runs Android 10-14 or Android 15-16 (S25 Series / One UI 8.5 & 9 BETA) and opens the matching APK download page.
*   **Interactive Windows File Picker:** Automatically launches a native Windows GUI File Open dialog filtering strictly for `*.apk` files (`sort *.apk`) after a 10-second download buffer.
*   **Fail-Safe APK Installation Engine:** Executes `adb install --user 0 -r -d --dont-kill` with full support for paths containing spaces, Arabic, English, or special characters, automatically validating 100% installation success.
*   **Anti-Auto-Update & Restriction Layer:** Applies targeted appops policies (`REQUEST_INSTALL_PACKAGES deny`, `RUN_IN_BACKGROUND deny`), disables `com.samsung.android.sm.policy`, clears preferred activities, and revokes app links to block forced background updates.
*   **Zero Data Loss:** Safely restores package flags without wiping your local SQLite database or SMS/MMS conversation logs.
*   **Universal Windows Compatibility:** Works seamlessly across Windows 7, 8, 10, and 11 with VT100 ANSI color support.
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

## ⚠️ Safe Use Notice & Disclaimer

> [!WARNING]
> ### ⚠️ Safe Use Notice & Disclaimer
> **Important**
> 
> While this tool is non-destructive to application packages, any system-level interaction via ADB carries minimal inherent risks. The maintainer assumes no liability for disrupted carrier-specific RCS profiles or accidental sync dropouts.
> 
> **Recommendation:** Always perform a manual backup via Samsung Smart Switch before running automated deployment scripts.

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
