get '/' do
  # Look in app/views/index.erb

  @game = Game.find(3)
  @box1 = @game.boxes.find_by(position: 1)
  @box2 = @game.boxes.find_by(position: 2)
  @box3 = @game.boxes.find_by(position: 3)
  @box4 = @game.boxes.find_by(position: 4)
  @box5 = @game.boxes.find_by(position: 5)
  @box6 = @game.boxes.find_by(position: 6)
  @box7 = @game.boxes.find_by(position: 7)
  @box8 = @game.boxes.find_by(position: 8)
  @box9 = @game.boxes.find_by(position: 9)


  erb :index
end

post '/getdata' do

	game = Game.find(3)
	game.count += 1
	game.save!

	box = game.boxes.find_by(position: params[:player][:elementid].to_i)
	box.value = params[:player][:move]
	box.save!

	redirect to "/"
end


