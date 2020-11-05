*** Settings ***
Resource




Example
    # ${foo}        Set Variable    1
    # ${bar}        Set Variable    2
    # ${foobar}     Evaluate    ${foo}+{bar}
    # #Should Be Equal      ${foobar}   3
    # Should Be Equal As Integers       ${foobar}   3

    ${loop}     Set Variable    2
    FOR     ${value}    IN RANGE    1   6
        ${loop}     Evaluate    ${loop}+${value} 
        Log To Console      ${loop} 
    END
    