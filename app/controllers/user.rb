get '/login' do
	erb :user_login
end

post '/login' do
	puts params
	if params[:user][:login] == "true"
		user = User.authenticate(params[:user])
		redirect to "/login" if user.nil?
	elsif params[:user][:sign_up] == "true"
		user = User.create(username: params[:user][:username], password: params[:user][:password])
	end
		session[:user_id] = user.id
		redirect to "/lobby"
end

get '/user/sign-out' do
	session[:user_id] = nil
	redirect to "/login"
end


get '/test/lobby' do
	erb :user_test_landing
end

get '/test/private' do
	puts "session_id: " + session[:user_id].to_s
	redirect to "/login" if session[:user_id].nil?
	erb :user_test_private
end
