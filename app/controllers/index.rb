get '/' do
	
	@events = Event.all
	erb :index
end

get '/sign_in' do
	erb :sign_in
end

post '/sign_in' do
	user = User.find_by(params[:email])
	login(user)
	redirect '/'
end

get '/sign_up' do
	erb :sign_up
end

post '/sign_up' do
	user = User.new(name: params[:name], email: params[:email], password: params[:password])
	if user.save
		login(user)
		redirect '/'
	else 
		redirect '/sign_up'
	end 
end