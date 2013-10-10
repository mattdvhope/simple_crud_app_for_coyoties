get '/' do
  # Look in app/views/index.erb
  erb :index
end  

post '/create' do
	@user = User.create(:name => params[:name], :email => params[:email])
erb :user
end 

get '/edit/:id' do
  @user = User.find(params[:id])
  erb :edit
end

post '/edit/:id' do
  @user = User.find(params[:id])
  @user.name = params[:name]
  @user.email = params[:email]
  @user.save

  erb :edit
end

post '/delete/:id' do
	user = User.find(params[:id])
	user.destroy

	redirect '/'
end