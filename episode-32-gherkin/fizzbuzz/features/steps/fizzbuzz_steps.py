from fizzbuzz import fizzbuzz

@given("FizzBuzz Input and Output")
def step_impl(context):
  context.fizzbuzz_data = context.table

@then("FizzBuzz returns the expected output")
def step_impl(context):
  for input, output in context.fizzbuzz_data:
    assert fizzbuzz(int(input)) == output
