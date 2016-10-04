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
        "User #{username} saved!"
    else
        erb(:signup)
    end
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
    
        
