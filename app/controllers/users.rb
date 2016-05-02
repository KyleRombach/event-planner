get '/users/:id' do
  @user = User.find(params[:id])
  @current_user = User.find(session[:user_id])
  erb :profile
end