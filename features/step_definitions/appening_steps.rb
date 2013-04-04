Given /^I have appenings called (.+)$/ do |appening_names|
  user = User.first
  appening_names.split(", ").each do |appening|
    Appening.create!(title: appening, user: user) 
  end
end

Given /^I have no appenings$/ do 
  Appening.destroy_all
end

Then /^I should have (\d+) appenings$/ do |count|
  Appening.count == count.to_i
end

Then /^I should have (\d+) accomplished appenings$/ do |count|
  Appening.where(accomplished: true).count == count.to_i
end
