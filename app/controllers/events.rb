get '/events/new' do
	erb :create_event
end

post '/events' do
	event = Event.create(name: params[:name], location: params[:location], start_time: params[:start_time], end_time: params[:end_time], description: params[:description], creator_id: session[:user_id])
	redirect "/events/#{event.id}"
end

get '/events/:id' do
	@event = Event.find(params[:id])
	erb :show_event
end


