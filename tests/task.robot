*** Settings ***
Resource        ../keywords/common.resource

Test Setup           setup.Open Android Application
Test Teardown        setup.Close Application

*** Test Cases ***
Verify add new task
    [Documentation]    Verifies that a user can add a new task with a reminder date successfully.
    ${taskname}    Set Variable    task_1
    ${remind_date}    common.Get Date    offset_day=${1}
    Log    ${remind_date}
    home_page.Click Add Task
    task_page.Verify New Task Page Visible
    task_page.Fill Task Form    ${taskname}    remind_date=${remind_date}
    task_page.Verify Remind Information Result
    task_page.Apply Task
    home_page.Verify Task Name Visible    ${taskname}

Verify user able to edit task
    [Documentation]    Verifies that a user can edit an existing task name successfully.
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
    [Documentation]    Verifies that a user cannot create a task with a reminder date in the past.
    ${taskname}    Set Variable    task_1
    ${date}        common.Get Date
    home_page.Click Add Task
    task_page.Verify New Task Page Visible
    task_page.Fill Task Form    ${taskname}    remind_date=${date}
    Wait Until Page Contains    ${label['enteredInPast']}
    task_page.Apply Task
    home_page.Verify Task Name Visible    ${taskname}    visible=${False}
