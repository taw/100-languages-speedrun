from behave import *

use_step_matcher("re")

@given('NAME "(.*?)"')
def step_impl(context, name):
  context.name = name

@then('LONGNEZ IZ (\d+)')
def step_impl(context, num):
  assert len(context.name) == int(num)

@then('HOOJ WERD IZ "(.*?)"')
def step_impl(context, s):
  assert context.name.upper() == s

@then('SMOL WERD IZ "(.*?)"')
def step_impl(context, s):
  assert context.name.lower() == s
