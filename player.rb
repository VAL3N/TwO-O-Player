class Player
  attr_accessor :name, :lives

  def initialize(name, lives = 3)
    self.name = name
    self.lives = lives
  end

  def lose_life
    self.lives -= 1
  end

end
