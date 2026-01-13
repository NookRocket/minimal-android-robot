*** Settings ***
Resource        ../keywords/common.resource

Test Setup           setup.Open Android Application
Test Teardown        setup.Close Application

*** Test Cases ***
User able to click add task button
    [Documentation]    Verifies that the user can access the New Task page by clicking the Add Task button.
    home_page.Verify Add Task Button Visible
    home_page.Click Add Task
    task_page.Verify New Task Page Visible
