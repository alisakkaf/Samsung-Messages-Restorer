# Samsung Messages Restorer 📱💥

A one-click ADB utility to safely restore and fix the stock Samsung Messages app after the forced July 2026 Google Messages migration—without losing any user data.

[![GitHub Release](https://img.shields.io/github/v/release/alisakkaf/Samsung-Messages-Restorer?style=flat-square)](https://github.com/alisakkaf/Samsung-Messages-Restorer/releases)
[![Downloads](https://img.shields.io/github/downloads/alisakkaf/Samsung-Messages-Restorer/latest/total?style=flat-square&color=blue)](https://github.com/alisakkaf/Samsung-Messages-Restorer/releases)
[![GitHub Stars](https://img.shields.io/github/stars/alisakkaf/Samsung-Messages-Restorer?style=flat-square&logo=github)](https://github.com/alisakkaf/Samsung-Messages-Restorer/stargazers)
[![Security Status](https://img.shields.io/badge/Security-Verified-success?style=flat-square)](SECURITY.md)
[![License](https://img.shields.io/github/license/alisakkaf/Samsung-Messages-Restorer?style=flat-square)](LICENSE)

---

## 🔍 The Problem (July 2026 Migration)
In July 2026, Samsung pushed an aggressive system update forcing users away from the native **Samsung Messages** app (`com.samsung.android.messaging`) in favor of Google Messages. For many, the stock app was disabled, hidden, or broken, making it difficult to access old chat interfaces.

**Samsung Messages Restorer** uses a smart automated script via Android Debug Bridge (ADB) to bypass this block, compare your active vs. base package versions, bypass the forced restriction, and safely re-enable your stock messaging environment **with 100% data preservation**.

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

## ⭐ Support & Contribution
If this automated utility successfully saved your chats and brought back your preferred stock messaging experience, please consider giving this repository a **Star (⭐)**! It helps other frustrated Galaxy users find this fix via search index engines.

Feel free to open an **Issue** if you run into syntax blocks or unexpected output results during package detection.
