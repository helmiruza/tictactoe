enable :sessions

get "/lobby" do
	@topten = User.order("points DESC").limit(10)
	
	if session[:user_id] != nil
		@gamecreated = Game.where(player1_id_id: session[:user_id], status: "Started").last

		if session[:creategame] == nil
			@gamesavailable = Game.where(status: "Waiting")

			erb :game_lobby
		elsif (session[:creategame] == "Yes") && (@gamecreated == nil)
			#awaits player2 to join
			@gamesavailable = Game.where(status: "Waiting")

		elsif (session[:creategame] == "Yes") && (@gamecreated != nil)
			#auto joins game created if player2 joins
			redirect to "/game/id/#{@gamecreated.id}"			
		end

	else
		redirect to "/login"
	end
end

post "/join" do

@gametojoin = Game.find_by(id: params[:game][:id])
@gametojoin.player2_id_id = params[:player2][:id]
@gametojoin.status = "Started"
@gametojoin.save!

	redirect to "/game/id/#{@gametojoin.id}"
end

post "/setdraw" do
	@game = Game.find_by(id: session[:game_id])
	@game.status = params[:game][:status]
	@game.save!

	#update points : 3points if draw
	user1 = User.find_by(id: @game.player1_id_id)
	user1.points += 3
	user1.save!

	user2 = User.find_by(id: @game.player2_id_id)
	user2.points += 3
	user2.save!	

	redirect to "/lobby"

end

post '/game/create' do

	creator = User.find_by(id: session[:user_id])
	game = Game.create

	game.player1_id_id = creator.id
	game.save!

	session[:creategame] = "Yes"
	session[:game_id] = game.id
	redirect to "/lobby"
end

get '/game/id/:id' do |id|
	
	@game = Game.find_by(id: id)
	session[:game_id] = @game.id
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

post '/getdata' do

 @game = Game.find_by(id: session[:game_id])
 @game.count += 1
 @game.save!

 box = @game.boxes.find_by(position: params[:player][:elementid].to_i)
 box.value = params[:player][:move]
 box.save!

  if @game.winnercheck(params[:player][:symbol]) == true
    @game.winner = params[:winner][:id]
    @game.status = "Finished"
    @game.save!

    #update points : 5points for the winner, 0 for loser
    if @game.winner == "Player1"
    	user = User.find_by(id: @game.player1_id_id)
    	user.points += 5
    	user.save!
    elsif @game.winner == "Player2"
    	user = User.find_by(id: @game.player2_id_id)
    	user.points += 5
    	user.save!
    end

  end

  redirect to "/game/id/#{@game.id}"
end

get '/test/game' do
	erb :game_test_public

end
