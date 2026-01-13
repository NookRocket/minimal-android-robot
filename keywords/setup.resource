*** Settings ***
Library        AppiumLibrary

*** Variables ***
${APPIUM_SERVER_URL}              http://127.0.0.1:4723
${ANDROID_PLATFORM_NAME}          Android
${ANDROID_AUTOMATION_NAME}        UiAutomator2
${ANDROID_APP_PATH}               ${EXECDIR}${/}app${/}app-release.apk
${DEVICE_NAME}                    Pixel7_Android13_API33
${APP_PACKAGE}                    com.avjindersinghsekhon.minimaltodo
${APP_ACTIVITY}                   com.example.avjindersinghsekhon.toodle.MainActivity

*** Keywords ***
Open Android Application
    [Documentation]    Opens the Android application using Appium with predefined configuration.
    AppiumLibrary.Open Application    remote_url=${APPIUM_SERVER_URL}    platformName=Android    
    ...    app=${ANDROID_APP_PATH}   
    ...    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}  
    ...    appActivity=${APP_ACTIVITY}    automationName=${ANDROID_AUTOMATION_NAME}
    ...    newCommandTimeout=300000
    ...    launchTimeout=3000000
    ...    noReset=${False}

Close Application
    [Documentation]    Closes the Android application and removes it from the device.
    AppiumLibrary.Remove Application    ${APP_PACKAGE}
    AppiumLibrary.Close All Applications
