*** Settings ***
Library        AppiumLibrary
Library        DateTime
Library        DebugLibrary
Resource        ../resources/locators/task_locator.resource
Resource        ../keywords/common.resource
Variables       ../resources/data/common.yaml

*** Keywords ***
Verify New Task Page Visible
    [Documentation]
    Wait Until Page Contains         ${label['title']}
    Wait Until Element Is Visible    ${task_page.inp_task_name}
    Wait Until Element Is Visible    ${task_page.btn_apply}

Scroll To Select Year
    [Arguments]    ${year}
    ${year_loc}    common.Build Locator    ${task_page.lbl_calendar_year}    {{year}}    ${year}

    FOR    ${i}    IN RANGE    20
        common.Swipe Down To Top     ${task_page.frm_list}
        ${year_visible}    common.Is Element Visible    ${year_loc}
        IF    ${year_visible}
            Click Element    ${year_loc}
            Click Element    ${task_page.btn_apply_remind_date}
            BREAK
        END
    END

Scroll To Select Date
    [Arguments]    ${date}
    ${date_loc}    common.Build Locator    ${task_page.lbl_calendar_date}    {{date}}    ${date}
    Wait Until Element Is Visible    ${task_page.frm_list}
    FOR    ${i}    IN RANGE    20
        common.Swipe Down To Top     ${task_page.frm_list}
        ${date_visible}    common.Is Element Visible    ${date_loc}
        IF    ${date_visible}
            Click Element    ${date_loc}
            Click Element    ${task_page.btn_apply_remind_date}
            BREAK
        END
    END


Fill Task Form
    [Arguments]    ${taskname}    ${remind_date}=${EMPTY}    ${remind_time}=${EMPTY}    ${apply}=${False}
    Wait Until Element Is Visible     ${task_page.inp_task_name}
    Clear Text    ${task_page.inp_task_name}
    Input Text    ${task_page.inp_task_name}    ${taskname}
    IF    '${remind_date}'
        Click Element    ${task_page.btn_switch_remind}
        Click Element    ${task_page.btn_set_remind_date}
        task_page.Scroll To Select Date    ${remind_date}

        IF    '${remind_time}'
            Clear Text    ${task_page.btn_set_remind_time}
            Input Text    ${task_page.btn_set_remind_time}    ${remind_time}
        END

    END
    
    IF    ${apply}
        Click Element    ${task_page.btn_apply}
    END

Verify Remind Information Result
    Wait Until Page Contains    ${label['reminderSetFor']}

Apply Task
    Click Element    ${task_page.btn_apply}
