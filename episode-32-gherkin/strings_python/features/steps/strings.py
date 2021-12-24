from behave import *

use_step_matcher("re")

@given('name is "(.*?)"')
def step_impl(context, name):
  context.name = name

@then('its length is (\d+)')
def step_impl(context, num):
  assert len(context.name) == int(num)

@then('its uppercase is "(.*?)"')
def step_impl(context, s):
  assert context.name.upper() == s

@then('its lowercase is "(.*?)"')
def step_impl(context, s):
  assert context.name.lower() == s
