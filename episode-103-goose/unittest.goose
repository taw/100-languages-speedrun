struct TestRunner {
  assertions : u64,
  failed : u64,
  current_test : u8[>..]
}

let test_runner = TestRunner{
  assertions: 0,
  failed: 0,
  current_test: ""
};

fn start_test(name : u8[:]) {
  test_runner.current_test = name;
}

fn assert_equal<T>(actual : T, expected : T) {
  test_runner.assertions += 1;
  if (expected != actual) {
    test_runner.failed += 1;
    print("current_test: ", test_runner.current_test, " expected: ", expected, ", actual: ", actual);
  }
}

fn report_test_results() {
  if test_runner.failed == 0 {
    print("test result: ok. ", test_runner.assertions, " assertions")
  } else {
    print("test result: failed. ", test_runner.assertions, " assertions, ", test_runner.failed, " failed")
  }
}
