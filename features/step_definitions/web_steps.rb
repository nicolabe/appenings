Given /^the following users:$/ do |user_table|
  user_table.hashes.each do |user_attributes|
    User.create!(user_attributes)
  end
end

Given /^I am on (.+)$/ do |page|
  visit path_to(page)
end

Given /^I am logged in as (.+)$/ do |username|
  user = User.find_by(username: username)
  visit '/login'
  fill_in "user_email", :with => user.email
  fill_in "user_password", :with => "12341234"
  click_button "Sign in"
end

When /^I go to (.+)$/ do |page|
  visit path_to(page)
end

When /^I follow (.+)$/ do |link|
  page.click_link link
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, with: value)
end

When /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I submit the form$/ do
  page.evaluate_script("document.forms[0].submit()")
end

When /^I confirm the dialog box$/ do
  page.driver.browser.switch_to.alert.accept
end

When /^I wait (\d+) seconds$/ do |seconds|
  sleep(seconds.to_i)
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should be on (.*)$/ do |path|
  current_path.should == path_to(path)
end
