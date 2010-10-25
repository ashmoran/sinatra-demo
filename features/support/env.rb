$LOAD_PATH.unshift(".") unless $LOAD_PATH.include?(".")
require 'app'

require 'capybara/cucumber'
Capybara.app = App

Capybara.save_and_open_page_path = File.join(File.dirname(__FILE__), "../../tmp/capybara")

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end

World(WithinHelpers)
