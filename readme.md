minimal-android-robot

A minimal Robot Framework test automation project for Android applications.

This repository demonstrates a lightweight structure for writing Robot Framework tests with modular keywords, reusable resources, and a sample Android app under test. It is designed as a clean foundation for Android UI test automation using Robot Framework (and Appium if required).

🧩 Project Structure
``` graphql
minimal-android-robot/
├── app/                     # Android app (APK) under test
├── keywords/                # Custom Robot Framework keywords
├── resources/               # Shared resources (locators, data, configs)
├── tests/                   # Robot Framework test suites
├── results/                 # Test execution reports and logs
├── .gitignore
└── README.md
```