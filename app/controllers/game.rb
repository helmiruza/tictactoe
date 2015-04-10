get "/lobby" do
	erb :game_lobby
end

post '/game/create' do
	game = Game.create
	redirect to "/game/id/#{game.id}"
end

get '/game/id/:game_id' do |x|
	@game = Game.find(x)
	@box1 = @game.boxes.find_by(position: 1)
	@box2 = @game.boxes.find_by(position: 2)
	@box3 = @game.boxes.find_by(position: 3)
	@box4 = @game.boxes.find_by(position: 4)
	@box5 = @game.boxes.find_by(position: 5)
	@box6 = @game.boxes.find_by(position: 6)
	@box7 = @game.boxes.find_by(position: 7)
	@box8 = @game.boxes.find_by(position: 8)
	@box9 = @game.boxes.find_by(position: 9)
	erb :game
end

get '/test/lobby' do
	erb :user_test_landing
end

get '/test/private' do
	puts "session_id: " + session[:user_id].to_s
	redirect to "/login" if session[:user_id].nil?
	erb :user_test_private
end

post '/getdata' do

 @game = Game.find_by(id: 6)
 @game.count += 1
 @game.save!

 box = @game.boxes.find_by(position: params[:player][:elementid].to_i)
 box.value = params[:player][:move]
 box.save!

  if @game.winnercheck(params[:player][:symbol]) == true
    @game.winner = params[:winner][:id]
    @game.save
  end

  redirect to "/game/id/#{@game.id}"
end
