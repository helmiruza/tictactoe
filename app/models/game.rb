class Game < ActiveRecord::Base
  # Remember to create a migration!
  has_many :boxes

  after_create :create_boxes

  def create_boxes
  	for i in 1..9
  		self.boxes.create(position: i, value: "")
  	end
  end
end
