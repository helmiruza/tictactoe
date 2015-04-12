class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :games, :foreign_key => :player1_id, :class_name => "Game"
  has_many :games, :foreign_key => :player2_id, :class_name => "Game"

  def self.authenticate(input)
  	user = User.find_by(username: input[:username])
  	return nil if user.nil?
  	return user if user.password == input[:password]
  	nil
  end
end
