require_relative "../test_helper"

class GreetingPageTest < FeatureTest

  def test_greeting_displayed_properly
    visit '/'
    assert page.has_content?("Welcome to Robot World")
  end

  def test_root_contain_statistics_access
    visit '/'
    assert page.has_content?("Statistics")
  end

  def test_root_contain_all_robots
    visit '/'
    assert page.has_content?("All Robots")
  end

  def test_root_contain_new_robots
    visit '/'
    assert page.has_content?("New Robot")
  end

  def test_root_contain_home_page
    visit '/'
    assert page.has_content?("Home Page")
  end

end
