class Game < ActiveRecord::Base
  # Remember to create a migration!
  has_many :boxes

  after_create :create_boxes

  def create_boxes
  	for i in 1..9
  		self.boxes.create(position: i, value: "")
  	end
  end

  def winnercheck(symbol)

  	@box1 = self.boxes.find_by(position: 1)
	@box2 = self.boxes.find_by(position: 2)
	@box3 = self.boxes.find_by(position: 3)
	@box4 = self.boxes.find_by(position: 4)
	@box5 = self.boxes.find_by(position: 5)
	@box6 = self.boxes.find_by(position: 6)
	@box7 = self.boxes.find_by(position: 7)
	@box8 = self.boxes.find_by(position: 8)
	@box9 = self.boxes.find_by(position: 9)

  	if ((@box1.value == symbol) && (@box2.value == symbol) && (@box3.value == symbol)) || ((@box4.value == symbol) && (@box5.value == symbol) && (@box6.value == symbol))  || ((@box7.value == symbol) && (@box8.value == symbol) && (@box9.value == symbol)) || ((@box1.value == symbol) && (@box4.value == symbol) && (@box7.value == symbol)) || ((@box2.value == symbol) && (@box5.value == symbol) && (@box8.value == symbol)) || ((@box3.value == symbol) && (@box6.value == symbol) && (@box9.value == symbol)) || ((@box1.value == symbol) && (@box5.value == symbol) && (@box9.value == symbol)) || ((@box3.value == symbol) && (@box5.value == symbol) && (@box7.value == symbol))
  		return true
  	else
  		return false
  	end
  end
end
