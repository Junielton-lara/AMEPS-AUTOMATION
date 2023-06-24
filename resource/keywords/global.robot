*** Settings ***
Resource  ../main.robot

*** Keywords ***
Open App
    [Arguments]    ${url}


    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}    Create Dictionary    download.default_directory=${download_folder}    safebrowsing.enabled=false

    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    --disable-web-security
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-logging
    Call Method    ${options}    add_argument    --enable-automation
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-browser-side-navigation
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --safebrowsing-disable-download-protection
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --acceptSslCerts
    Call Method    ${options}    add_argument    --disable-dev-shm-usage

    #ajustes para execução em LINUX
    ${name}  Evaluate  platform.system()  platform
        IF  $name.lower() == 'linux'
            ${ws}  set variable  window-size=1366,768
            Call Method    ${options}    add_argument    --${ws}
            
        END

    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    
    Open Browser    ${url}    chrome    options=${options}


Fechar Navegador
    Close Browser



Evidênciar teste
    Capture Page Screenshot
    
                                      

Loading
    [Arguments]  ${time}=600
    ${status}  Run Keyword And Return Status    Wait Until Element Is Visible  id=UpdateProgress1  5
    IF  ${status}
        Wait Until Element Is Not Visible    id=UpdateProgress1  ${time}
    END

Wait Element
    [Arguments]  ${locator}  ${timeout}=${default_timeout}  ${vanish}=False
    IF  ${vanish}
        Wait Until Element Is Not Visible  ${locator}  ${timeout}
    ELSE
        Wait Until Element Is Visible  ${locator}  ${timeout}
    END

Click
    [Arguments]  ${locator}  ${wait}=False  ${wait_time}=${interract_timeout}  ${sleep}=0  ${extra_time}=600
    Wait Element  ${locator}  ${wait_time}
    Scroll Element Into View  ${locator}
    Click Element  ${locator}
    IF  ${take_print}
        Sleep    0.5
    END
    IF  ${wait}
        Loading  ${extra_time}
        Sleep    0.5
    END
    IF  ${sleep} > 0
        Sleep  ${sleep}
    END

Get Input value
    [Arguments]  ${locator}
    ${text}  Get Text  ${locator}
    ${value}  Get Element Attribute    ${locator}    value
    ${content}  Set Variable If    len($text) > 0  ${text}  ${value}
    [Return]  ${content}

Input
    [Arguments]  ${locator}  ${message}  ${clear}=True  ${tab}=True  ${wait}=False  ${wait_time}=${interract_timeout}  ${sleep}=0
    Wait Element  ${locator}  ${wait_time}
    Scroll Element Into View  ${locator}
    ${value}  Get Input value  ${locator}
    ${size}  Get Length    ${value}
    ${clean}  Set Variable  ${EMPTY}
    ${next}  Set Variable  ${EMPTY}
    IF  ${size} > 0
        ${clean}  Set Variable  CTRL+A+BACKSPACE
    END
    IF  ${tab}
        ${next}  Set Variable  TAB
    END
    # IF  ${clear}
    #     Clear Element Text  ${locator}
    #     Loading
    # END
    Press Keys  ${locator}  ${clean}  ${message}  ${next}
    # IF  ${tab}
    #     Press Keys  ${locator}  TAB
    # END
    IF  ${take_print}
        Sleep    0.5
    END
    IF  ${wait}
        Loading
        Sleep    0.5
    END
    IF  ${sleep} > 0
        Sleep  ${sleep}
    END


Get Date
    [Arguments]  ${alt}=0d  ${format}=%d%m%Y
    ${data}  Get Current Date  increment=${alt}  result_format=${format}
    [Return]  ${data}