
*** Settings ***

Library  SeleniumLibrary
Library  SeleniumScreenshots

*** Variables ***

${BROWSER}  firefox

*** Keywords ***

Open robotframework.org
    Set window size  800  600
    Go to  https://robotframework.org

*** Test Cases ***

Open browser
    Open browser  about:blank  browser=${BROWSER}

*** Test Cases ***

Capture and crop page screenshot
    Open robotframework.org
    Capture and crop page screenshot
    ...  screenshot.png
    ...  css:H1.main-header
    ...  css:NAV[id='navigation'] > DIV > IMG

*** Test Cases ***

Highlighting an area
    Open robotframework.org
    Highlight
    ...  link:INTRODUCTION  # locator (id, css, name or link)
    Capture and crop page screenshot
    ...  screenshot.png     # filename
    ...  link:INTRODUCTION  # locator

*** Test Cases ***

Clear highlighting
    Clear highlight  link:INTRODUCTION
    Capture and crop page screenshot
    ...  screenshot.png
    ...  link:INTRODUCTION

*** Test Cases ***

Update style
    Open robotframework.org
    Update element style
    ...  link:INTRODUCTION  # locator (id, css, name or link)
    ...  outline            # style
    ...  dotted yellow 3px  # value
    Capture and crop page screenshot
    ...  screenshot-1.png
    ...  link:INTRODUCTION
    Update element style
    ...  link:INTRODUCTION
    ...  outline
    ...  none
    Capture and crop page screenshot
    ...  screenshot-2.png
    ...  link:INTRODUCTION

*** Test Cases ***

Add dot
    Open robotframework.org
    Add dot
    ...  link:INTRODUCTION
    ...  left=8
    Capture and crop page screenshot
    ...  screenshot.png
    ...  link:INTRODUCTION

*** Test Cases ***

Add numbered dots dots
    Open robotframework.org
    Add dot
    ...  link:INTRODUCTION
    ...  text=1
    ...  left=8
    Add dot
    ...  link:EXAMPLES
    ...  text=2
    ...  left=8
    Capture and crop page screenshot
    ...  screenshot.png
    ...  link:INTRODUCTION
    ...  link:EXAMPLES

*** Test Cases ***

Add and remove dot
    Open robotframework.org
    ${dot}=  Add dot
    ...  link:INTRODUCTION
    ...  left=8  background=red
    Capture and crop page screenshot
    ...  screenshot-1.png
    ...  link:INTRODUCTION
    Remove element  ${dot}
    Capture and crop page screenshot
    ...  screenshot-2.png
    ...  link:INTRODUCTION

*** Test Cases ***

Add note
    Open robotframework.org
    ${note} =  Add note 
    ...  css:NAV[id='navigation'] > DIV > IMG
    ...  text=I am a robot. With opinions.
    ...  width=160
    ...  position=right
    Capture and crop page screenshot
    ...  screenshot.png
    ...  css:NAV[id='navigation'] > DIV > IMG
    ...  ${note}

*** Test Cases ***

Add pointy note
    Open robotframework.org
    ${note} =  Add pointy note
    ...  link:INTRODUCTION
    ...  text=Start here.
    ...  position=right
    Capture and crop page screenshot
    ...  screenshot.png
    ...  link:INTRODUCTION
    ...  ${note}

*** Settings ***

Suite Teardown  Close all browsers
