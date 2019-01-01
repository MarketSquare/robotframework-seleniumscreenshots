
*** Settings ***

Library  SeleniumLibrary
Library  SeleniumScreenshots

*** Variables ***

${BROWSER}  firefox

*** Test Cases ***

Open browser
    Open browser  about:blank  browser=${BROWSER}

*** Keywords ***

Open robotframework.org
    Set window size  800  600
    Go to  https://robotframework.org

*** Test Cases ***

Highlighting an area
    Open robotframework.org
    Highlight  link:INTRODUCTION
    Capture and crop page screenshot
    ...  screenshot.png
    ...  link:INTRODUCTION

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
    ...  link:INTRODUCTION
    ...  outline  dotted yellow 3px
    Capture and crop page screenshot
    ...  screenshot-1.png
    ...  link:INTRODUCTION
    Update element style
    ...  link:INTRODUCTION
    ...  outline  none
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

Add note
    Open robotframework.org
    ${note} =  Add note 
    ...  link:INTRODUCTION
    ...  text=Start here:
    ...  position=top
    Capture and crop page screenshot
    ...  screenshot.png
    ...  link:INTRODUCTION
    ...  ${note}

*** Test Cases ***

Add pointy note
    Open robotframework.org
    ${note} =  Add pointy note
    ...  link:INTRODUCTION
    ...  text=Start here
    ...  position=right
    Capture and crop page screenshot
    ...  screenshot.png
    ...  link:INTRODUCTION
    ...  ${note}

*** Settings ***

Suite Teardown  Close all browsers
