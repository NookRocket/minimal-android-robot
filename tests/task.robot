*** Settings ***
Resource        ../keywords/common.resource

Test Setup           setup.Open Android Application
Test Teardown        setup.Close Application

*** Test Cases ***
Verify add new task
    [Documentation]
    ${taskname}    Set Variable    task_1
    ${date}        Set Variable    01 January 2026
    home_page.Click Add Task
    task_page.Verify New Task Page Visible
    task_page.Fill Task Form    ${taskname}    remind_date=${date}
    task_page.Verify Remind Information Result
    task_page.Apply Task
    home_page.Verify Task Name Visible    ${taskname}

Verify user able to edit task
    ${first_name}     Set Variable    first_name
    ${second_name}    Set Variable    second_name
    home_page.Click Add Task
    task_page.Fill Task Form    ${first_name}    apply=${True}
    home_page.Verify Task Name Visible    ${first_name}
    home_page.Click Task Name    ${first_name}
    task_page.Fill Task Form    ${second_name}    apply=${True}
    home_page.Verify Task Name Visible    ${first_name}    visible=${False}
    home_page.Verify Task Name Visible    ${second_name}

Verify user not able to set past time
    ${taskname}    Set Variable    task_1
    ${date}        Set Variable    01 January 2026
    home_page.Click Add Task
    task_page.Verify New Task Page Visible
    task_page.Fill Task Form    ${taskname}    remind_date=${date}
