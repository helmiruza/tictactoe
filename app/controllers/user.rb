enable :sessions

get '/' do
	redirect to "/login"
end
get '/login' do
	@topten = User.order("points DESC").limit(10)
	erb :user_login
end

post '/login' do
	
	if params[:user][:login] == "true"
		user = User.authenticate(params[:user])
		redirect to "/login" if user.nil?
	elsif params[:user][:sign_up] == "true"
		user = User.create(username: params[:user][:username], password: params[:user][:password])
	end
		session[:user_id] = user.id
		session[:username] = user.username
		redirect to "/lobby"
end

get '/logout' do
	games = Game.where(player1_id_id: session[:user_id], status: "Waiting")
	games.each do |game|
		game.status = "Canceled"
		game.save!
	end

	session.clear
	redirect to "/login"
end