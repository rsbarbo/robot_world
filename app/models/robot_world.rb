class RobotWorld
  def self.database
    @database ||= YAML::Store.new("db/robotworlddb")
  end
end
