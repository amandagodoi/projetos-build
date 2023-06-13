*** Settings ***
Library   SeleniumLibrary


*** Variables ***



*** Keywords ***
abrir site educacao financeira b3
    Open Browser    https://edu.b3.com.br/login   chrome

fechar navegador
    Close Browser

abrir site da b3
    Open Browser    https://www.b3.com.br/pt_br/   chrome

*** Test Cases ***
Cenário 1: Teste de abrir o Site de Educação Financeira da B3
    abrir site educacao financeira b3
    fechar navegador
    
Cenário 2: Teste de abrir o site da B3
    abrir site da b3
    fechar navegador