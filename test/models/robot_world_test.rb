require_relative "../test_helper"

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def current_robot_id
    robot_manager.all.last.id
  end

  def test_robot_is_created
    robot_manager.create({:name => "NameTest",
      :city => "CityTest", :state => "StateTest",
      :avatar => "AvatarTest", :birthdate => "01/01/1901",
      :date_hired => "01/01/1901", :department => "DeptTest"})

      assert_equal 1, robot_manager.all.count
  end

  def test_robot_is_created_and_return_specifics
    robot_manager.create({:name => "NameTest",
      :city => "CityTest", :state => "StateTest",
      :avatar => "AvatarTest", :birthdate => "01/01/1901",
      :date_hired => "01/01/1901", :department => "DeptTest"})

      robot = robot_manager.find(current_robot_id)
      assert_equal "NameTest", robot.name
      assert_equal "StateTest", robot.state
      assert_equal "CityTest", robot.city
  end

end
