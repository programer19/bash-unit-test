#!/bin/bash
set -Ee

function echo_test_result {
    local TEST_NAME=$1
    local TEST_STATUS=$2
    local CGREEN="\033[0;32m"
    local CRED="\033[0;31m"
    local CDEF="\033[0m"
    if [ "$TEST_STATUS" = true ]; then
        echo -e "${CGREEN}SUCCESS: ${CDEF}\t ${TEST_NAME}"
    else
        echo -e "${CRED}FAILED: ${CDEF}\t ${TEST_NAME}"
    fi
}
    
function unit_test {
    local TEST_NAME=$1
    trap "echo_test_result $TEST_NAME false; trap ERR; return 1" ERR
    $TEST_NAME
    trap ERR
    if [ $? -eq "0" ]; then
        echo_test_result $TEST_NAME true
    fi
}

function assert {
    local COMPARE_OPERATOR=$1
    local VALUE=$2
    local EXPECT=$3
    if [ "$VALUE" $COMPARE_OPERATOR "$EXPECT" ]; then
        return 0
    else
        return 1
    fi
}

