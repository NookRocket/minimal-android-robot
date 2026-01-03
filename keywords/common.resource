*** Settings ***
Library        AppiumLibrary
Library        String

Resource        ../keywords/setup.resource
Resource        ../keywords/home_page.resource
Resource        ../keywords/task_page.resource

*** Keywords ***
Build Locator
    [Documentation]
    ...  Replaces a substring in a given locator with a new value (e.g., placeholders).
    [Arguments]    ${locator}    ${search_for}    ${replace_with}
    ${replace_with}    Convert To String    ${replace_with}
    ${new_loc}    String.Replace String    ${locator}    ${search_for}    ${replace_with}
    RETURN    ${new_loc}

Swipe Down To Top
    [Arguments]    ${locator}
    ${loc_size}        AppiumLibrary.Get Element Size    ${locator}
    ${loc_point}       AppiumLibrary.Get Element Location    ${locator}
    ${center_x}        Evaluate      ${loc_point['x']} + (${loc_size['width']}*0.5)
    ${center_y}        Evaluate      ${loc_point['y']} + (${loc_size['height']} * 0.5)
    ${start_y}         Evaluate      ${loc_point['y']} + (${loc_size['height']} * 0.75)
    ${end_y}           Evaluate      ${loc_point['y']} + (${loc_size['height']} * 0.25)
    Swipe              ${center_x}    ${start_y}   ${center_x}   ${end_y}  1000

Is Element Visible
    [Arguments]    ${locator}    ${timeout}=5s
    ${element_vis}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}
    RETURN    ${element_vis}
