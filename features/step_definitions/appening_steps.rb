Given /^I have appenings called (.+)$/ do |appening_names|
  user = User.first
  appening_names.split(", ").each do |appening|
    Appening.create!(title: appening, user: user) 
  end
end

Given /^I have no appenings$/ do 
  Appening.destroy_all
end

Given /^(.+) has posted a new appening "(.+)"$/ do |user, appening_title|
  step "I am logged in as #{user}"
  step "I follow new"
  step "I fill in \"new_appening_field\" with \"#{appening_title}\""
  step "I submit the form"
  step "I wait 1 seconds"
end

Then /^I should have (\d+) appenings$/ do |count|
  Appening.count == count.to_i
end

Then /^I should have (\d+) accomplished appenings$/ do |count|
  Appening.where(accomplished: true).count == count.to_i
end
