
# CoinCatcher

CoinCatcher is a cryptocurrency portfolio management app designed to help users manage their crypto assets, analyze risks, calculate taxes, and stay informed about potential scams in the crypto world. This app is built using SwiftUI for iOS devices and provides a seamless and intuitive interface for crypto investors.

---

## Features

1. **Portfolio Management**
   - Track your cryptocurrency holdings, values, and associated risk levels.
   - Set alert thresholds for asset values and get notified when conditions are met.

2. **Tax Calculator**
   - Calculate taxes for your cryptocurrency transactions (Buy, Sell, or Stake) quickly and efficiently.

3. **Risk Analysis**
   - Evaluate and visualize the risk level of each crypto asset in your portfolio.

4. **Scam Database**
   - Search for reported crypto scams and contribute by reporting new scams to protect the community.

5. **PDF Report Generation**
   - Export portfolio data and analysis as a professional-looking PDF document.

---

## Problem It Solves

Cryptocurrency investments often come with challenges like:
- Difficulty in tracking multiple crypto assets.
- Calculating taxes for transactions in compliance with tax regulations.
- Assessing risks associated with investments.
- Staying informed about scams and fraud in the crypto market.

**CoinCatcher solves these problems by:**
- Centralizing portfolio tracking with detailed risk analysis.
- Providing a simple interface for calculating taxes.
- Offering scam reporting and searching to create awareness.
- Enabling users to generate detailed PDF reports for tax filings or personal records.

---

## How It Solves the Problem

- **Ease of Use:** A simple TabView-based navigation allows users to access features like portfolio management, tax calculation, and scam databases effortlessly.
- **Real-Time Alerts:** Users can set thresholds for portfolio alerts to stay informed about market changes.
- **Community Collaboration:** The scam database enables users to contribute to and benefit from a shared knowledge base.
- **Professional Tools:** The tax calculator and PDF generation tools save time and effort in managing investments professionally.

---

## Additional Note on APIs

This project does not include external APIs for fetching real-time cryptocurrency data or scam reports. For more accurate and dynamic information, you will need to:
- Integrate APIs like **CoinGecko**, **CryptoCompare**, or similar for live data.
- Modify the existing code to include API keys and handle API responses.

---

## How to Run the App

1. **Requirements:**
   - macOS with Xcode installed.
   - iOS device or simulator running iOS 14.0 or later.

2. **Steps to Run:**
   - Open the `CoinCatcher.xcodeproj` file in Xcode.
   - Select the desired simulator or connected iOS device.
   - Build and run the project by clicking the **Run** button in Xcode.

3. **Additional Notes:**
   - Ensure you have an active Apple Developer account to run the app on a physical device.
   - Modify `PortfolioView.swift` or other files to customize initial data if needed.
