*** Settings ***
Library        AppiumLibrary
Library        Collections

Resource        ../resources/locators/home_locator.resource

*** Keywords ***
Format Task Name
    [Documentation]    Formats a task name by capitalizing the first letter.
    ...
    ...    Arguments:
    ...    - taskname: Raw task name string.
    ...
    ...    Returns:
    ...    - taskname: Formatted task name.
    [Arguments]    ${taskname}
    ${first_letter}    Convert To Upper Case    ${taskname[0]}
    ${taskname}    Format String    ${first_letter}${taskname[1:]}
    RETURN    ${taskname}

Retrieve Task Item
    [Documentation]    Retrieves the locator of a task item by task name.
    ...
    ...    Arguments:
    ...    - taskname: Name of the task.
    [Arguments]    ${taskname}
    ${taskname}    home_page.Format Task Name    ${taskname}
    ${task_loc}    common.Build Locator    ${home_page.lbl_task_by_name}    {{taskname}}    ${taskname}
    RETURN   ${task_loc}

Verify Add Task Button Visible
    [Documentation]    Verifies that the Add Task button is visible on the home page.
    Wait Until Element Is Visible    ${home_page.btn_add_task}

Click Add Task
    [Documentation]    Clicks the Add Task button on the home page.
    Click Element    ${home_page.btn_add_task}

Verify Task Name Visible
    [Documentation]    Verifies whether a task name is visible or not visible on the page.
    ...
    ...    Arguments:
    ...    - taskname: Name of the task.
    ...    - visible (optional): Expected visibility state of the task name.
    [Arguments]    ${taskname}    ${visible}=${True}
    ${expected_taskname}    home_page.Format Task Name    ${taskname}
    IF    ${visible}
        Wait Until Page Contains    ${expected_taskname}
    ELSE
        Wait Until Page Does Not Contain    ${expected_taskname}
    END

Click Task Name
    [Documentation]    Clicks a task item by task name.
    ...
    ...    Arguments:
    ...    - taskname: Name of the task to be clicked.
    [Arguments]    ${taskname}
    ${task_loc}    home_page.Retrieve Task Item    ${taskname}
    Click Element    ${task_loc}
