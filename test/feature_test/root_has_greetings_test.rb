require_relative "../test_helper"

class GreetingPageTest < FeatureTest

  def test_greeting_displayed_properly
    visit '/'
      assert page.has_content?("Welcome to Robot World")
    end

end
