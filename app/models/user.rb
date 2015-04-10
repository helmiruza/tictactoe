class User < ActiveRecord::Base
  # Remember to create a migration!
  def self.authenticate(input)
  	user = User.find_by(username: input[:username])
  	return nil if user.nil?
  	return user if user.password == input[:password]
  	nil
  end
end
