class Robot
  attr_reader :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :data_hire,
              :department,
              :id

  def initialize(data)
    @id          = data["id"]
    @name        = data["name"]
    @city        = data["city"]
    @state       = data["state"]
    @avatar      = data["avatar"]
    @birthdate   = data["birthdate"]
    @data_hire   = data["data_hire"]
    @department  = data["department"]
  end

end
