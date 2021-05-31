# bash-unit-test
Позволяет реализовать unit тесты в bash скриптах
## Пример использования
```bash
    source unit-test.sh
    
    function assert_testing_success {
        assert "=" "hello" "hello"
        assert "-ne" 5 4
        assert "-gt" 5 4
    }
    unit_test "assert_testing_success"
    
    function assert_testing_failed {
        assert "-lt" 5 4
        assert "-ne" 4 4
    }
    unit_test "assert_testing_failed"
    
    exit
```
