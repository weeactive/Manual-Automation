*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.ebay.com/
${browser}    gc
${locator_search}    id=gh-ac
${locator_btn_search}    id=gh-search-btn
${locator_select_categories}    id=gh-cat
${locator_result_number}    xpath=//*[@id="mainContent"]/div[2]/div[2]/div[1]/div[1]/div[1]/h1/span[1]
${locator_name_product}    xpath=//*[@id="item3497a6b81c"]/div/div[2]/a/div/span

*** Keywords ***
OpenEbayBrowser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${locator_search}

Verify input Search Data - press key
    Wait Until Element Is Visible    ${locator_search}
    Input Text    ${locator_search}    iPhone
    Select Categories
    Press Keys    ${locator_btn_search}    ENTER

Verify input Search Data - click button
    Wait Until Element Is Visible    ${locator_search}
    Input Text    ${locator_search}    iPhone
    Select Categories
    Click Element    ${locator_btn_search}

Select Categories
    Wait Until Element Is Enabled    ${locator_select_categories}
    Click Element    ${locator_select_categories}
    Select From List By Value    ${locator_select_categories}    58058

Select Product
    Wait Until Element Is Visible    ${locator_name_product}
    Click Element    ${locator_name_product}
    Wait Until Page Contains    10 x STYLUS PEN PENS for TOUCH SCREEN IPAD IPHONE TABLET SAMSUNG TAB etc.

*** Test Cases ***
# Verify input Test - press key
#     OpenEbayBrowser
#     Verify input Search Data - press key
#     Close Browser

# Verify input Test - click button
#     OpenEbayBrowser
#     Verify input Search Data - click button
#     Close Browser

Verify Result Data
    OpenEbayBrowser
    Verify input Search Data - press key
    Wait Until Element Is Visible    ${locator_result_number}
    ${num}=    Get Text    ${locator_result_number}
    IF    ${num} > 0
        Select Product
    ELSE
        Close Browser
    END
    

