# Navigation

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  case matcher = path_to(page_name)
  when String
    current_path.should == matcher
  when Regexp
    current_path.should =~ matcher
  end
end


# Page contents

Then /^(?:|I )should see "([^"]*)"(?: within "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    page.should have_content(text)
  end
end

Then /^(?:|I )should not see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  with_scope(selector) do
    page.should_not have_content(text)
  end
end


# Utility

Then /^show me the page$/ do
  save_and_open_page
end
