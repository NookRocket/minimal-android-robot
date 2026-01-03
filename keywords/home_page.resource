*** Settings ***
Library        AppiumLibrary
Library        Collections

Resource        ../resources/locators/home_locator.resource


*** Keywords ***
Format Task Name
    [Arguments]    ${taskname}
    ${first_letter}    Convert To Upper Case    ${taskname[0]}
    ${taskname}    Format String    ${first_letter}${taskname[1:]}
    RETURN    ${taskname}

Retrieve Task Item
    [Arguments]    ${taskname}
    ${taskname}    home_page.Format Task Name    ${taskname}
    ${task_loc}    common.Build Locator    ${home_page.lbl_task_by_name}    {{taskname}}    ${taskname}
    RETURN   ${task_loc}

Verify Add Task Button Visible
    Wait Unit Element Is Visible    ${home_page.btn_add_task}

Click Add Task
    Click Element    ${home_page.btn_add_task}

Verify Task Name Visible
    [Arguments]    ${taskname}    ${visible}=${True}
    ${expected_taskname}    home_page.Format Task Name    ${taskname}
    IF    ${visible}
        Wait Until Page Contains    ${expected_taskname}
    ELSE
        Wait Until Page Does Not Contain    ${expected_taskname}
    END

Click Task Name
    [Arguments]    ${taskname}
    ${task_loc}    home_page.Retrieve Task Item    ${taskname}
    Click Element    ${task_loc}
