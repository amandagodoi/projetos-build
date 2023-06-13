*** Settings ***
Library     RequestsLibrary
Library     json
*** Variables ***
${Base_URL}               http://localhost:5000

*** Test Cases ***

Chamar index
    ${response}=         GET             http://localhost:5000/
    Should Be Equal As Strings           ${response.status_code}  200
    Should Be Equal As Strings           ${response.content}  Hello World 12345!

Listar tarefas (vazio)
    ${response}=         GET            http://localhost:5000/todoitems 
    Should Be Equal As Strings           ${response.status_code}    200
    Should Be Equal As Strings           ${response.content}   	[]

Adicionar tarefa
    ${body}=     create dictionary        name=separar documentacao  isComplete=${False}
    ${json}=     json.dumps  ${body}
    ${header}=   create dictionary        Content-Type=application/json
    ${response}=         POST            http://localhost:5000/todoitems     data=${json}   headers=${header}
    Should Be Equal As Strings            ${response.status_code}    201

Listar tarefas
    ${response}=         GET            http://localhost:5000/todoitems 
    Should Be Equal As Strings           ${response.status_code}    200
    Should Be Equal As Strings           ${response.content}   	[{"id":1,"name":"separar documentacao","isComplete":false}]

Deletar tarefa
    ${response}=         DELETE           http://localhost:5000/todoitems/1
    Should Be Equal As Strings           ${response.status_code}    200
    
Listar tarefas (vazio)
    ${response}=         GET            http://localhost:5000/todoitems 
    Should Be Equal As Strings           ${response.status_code}    200
    Should Be Equal As Strings           ${response.content}   	[]