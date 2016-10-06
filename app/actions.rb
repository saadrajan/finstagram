helpers do
    def current_user
        User.find_by(id: session[:user_id])
    end
end


get '/' do
    
    @posts = Post.order(created_at: :desc)
    erb (:index)
    
end
 
get '/signup' do
    @user = User.new
    erb(:signup)
end

 post'/signup' do
    email = params[:email]
    avatar_url = params[:avatar_url]
    username = params[:username]
    password = params[:password]
    
    @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
    
    if @user.save
        redirect to('/login')
    else
        erb(:signup)
    end

 end
 
get '/login' do
    erb(:login)
end

post '/login' do
    username = params[:username]
    password = params[:password]
    
    user = User.find_by(username: username)
    
    if user && user.password == password
        session[:user_id] = user.id
        redirect to('/')
    else
        @error_message = "Login failed."
        erb(:login)
    end  
end

get '/Logout' do
     session[:user_id] = nil
     redirect to('/')
end



 
    # if time ago is greater than one hour 
    #if time_ago_in_minutes > 60
    #   more than an hour ago
    #elsif time_ago_in_minutes == 60
    #   an hour
    #elsif time_ago_in_minutes <= 1
    #   just a moment ago
    #if time ago is less than one hour
    #else 
    #   less than an hour
    
        
