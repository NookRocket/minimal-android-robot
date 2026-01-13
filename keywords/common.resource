*** Settings ***
Library        AppiumLibrary
Library        String

Resource        ../keywords/setup.resource
Resource        ../keywords/home_page.resource
Resource        ../keywords/task_page.resource

*** Keywords ***
Build Locator
    [Documentation]    Replaces a substring in a given locator with a new value (e.g., placeholders).
    ...    Arguments:
    ...    - locator: Original locator string.
    ...    - search_for: Substring or placeholder to be replaced.
    ...    - replace_with: Value used to replace the placeholder.
    ...
    ...    Returns:
    ...    - new_loc: Updated locator string.
    [Arguments]    ${locator}    ${search_for}    ${replace_with}
    ${replace_with}    Convert To String    ${replace_with}
    ${new_loc}    String.Replace String    ${locator}    ${search_for}    ${replace_with}
    RETURN    ${new_loc}

Swipe Down To Top
    [Documentation]    Performs a swipe gesture from the lower part of the element to the upper part.
    ...
    ...    Arguments:
    ...    - locator: Locator of the element used as swipe reference.
    [Arguments]    ${locator}
    ${loc_size}        AppiumLibrary.Get Element Size    ${locator}
    ${loc_point}       AppiumLibrary.Get Element Location    ${locator}
    ${center_x}        Evaluate      ${loc_point['x']} + (${loc_size['width']}*0.5)
    ${center_y}        Evaluate      ${loc_point['y']} + (${loc_size['height']} * 0.5)
    ${start_y}         Evaluate      ${loc_point['y']} + (${loc_size['height']} * 0.75)
    ${end_y}           Evaluate      ${loc_point['y']} + (${loc_size['height']} * 0.25)
    Swipe              ${center_x}    ${start_y}   ${center_x}   ${end_y}  1000

Is Element Visible
    [Documentation]    Checks whether an element becomes visible within the specified timeout.
    ...
    ...    Arguments:
    ...    - locator: Locator of the element.
    ...    - timeout (optional): Maximum wait time for visibility.
    ...
    ...    Returns:
    ...    - element_vis: Boolean result indicating visibility status.
    [Arguments]    ${locator}    ${timeout}=5s
    ${element_vis}    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}
    RETURN    ${element_vis}

Get Date
    [Documentation]    Returns a formatted date string based on the current date and day offset.
    ...
    ...    Arguments:
    ...    - format (optional): Output date format.
    ...    - offset_day (optional): Number of days to offset from current date.
    ...
    ...    Returns:
    ...    - date: Formatted date string.
    [Arguments]    ${format}=%d %B %Y    ${offset_day}=${0}
    ${current_date}    Get Current Date
    ${date}    Add Time To Date    ${current_date}    ${offset_day} day
    ${date}    Convert Date    ${date}    result_format=${format}
    RETURN    ${date}
