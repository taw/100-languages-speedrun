let { Given, Then } = require("@cucumber/cucumber")
let assert = require("assert")

Given('name is {string}', function (string) {
  this.name = string
})

Then('its length is {int}', function (int) {
  assert.equal(this.name.length, int)
})

Then('its uppercase is {string}', function (string) {
  assert.equal(this.name.toUpperCase(), string)
})

Then('its lowercase is {string}', function (string) {
  assert.equal(this.name.toLowerCase(), string)
})
