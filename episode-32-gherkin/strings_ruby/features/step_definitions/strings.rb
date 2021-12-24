Given('name is {string}') do |string|
  @name = string
end

Then('its length is {int}') do |int|
  expect(@name.length).to eq(int)
end

Then('its uppercase is {string}') do |string|
  expect(@name.upcase).to eq(string)
end

Then('its lowercase is {string}') do |string|
  expect(@name.downcase).to eq(string)
end
