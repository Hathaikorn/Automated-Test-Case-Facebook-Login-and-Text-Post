*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}     chrome
${FACEBOOK_URL}  https://www.facebook.com
${USERNAME}    YOURUSERNAME
${PASSWORD}    YOURPASSWORD
${POST_TEXT}   My name is Hathaikorn

*** Test Cases ***
Facebook Login and Text Post
    Open Browser    ${FACEBOOK_URL}    ${BROWSER}
    Maximize Browser Window
    Login to Facebook
    Sleep    10s  
    Click Element    css=[aria-label="Create a post"]
    Execute JavaScript    document.querySelector('[role="textbox"]').innerText = "${POST_TEXT}";
    Sleep    5s
    Click Element    css=[aria-label="Post"]
    Close Browser

*** Keywords ***
Login to Facebook
    Input Text    name=email    ${USERNAME}
    Input Password    name=pass    ${PASSWORD}
    Click Button    name=login
