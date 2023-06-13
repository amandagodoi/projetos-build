*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${input_name}       id:name
${input_phone}      id:phone
${input_email}      id:email
${input_password}   id:password
${textarea_address}  id: address
${button_submit}    name: submit


*** Keywords ***
abrir navegador e acessar o site
    Open Browser     https://itera-qa.azurewebsites.net/home/automation  chrome

preencher campos
    Input Text      ${input_name}         Amanda
    Sleep            2s
    Input Text      ${input_phone}        11988776655
    Sleep            2s
    Input Text      ${input_email}        amanda@gmail.com
    Sleep            2s
    Input Text      ${input_password}     12345
    Sleep            2s
    Input Text      ${textarea_address}   Rua XV de Novembro
    Sleep            2s
clicar em submit
    Click Element   ${button_submit} 
    Sleep            2s
fechar navegador
    Close Browser

*** Test Cases ***
Cenário 1: Preencher formulário
    abrir navegador e acessar o site
    preencher campos
    clicar em submit
    fechar navegador