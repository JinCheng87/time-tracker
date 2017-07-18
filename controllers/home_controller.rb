require 'pry'
class App
  get '/' do
    erb :'home/index'
  end

  get '/register' do
    user = User.new
    erb :'/user/new', locals: {user: user}
  end

  get '/login' do
    erb :'/user/login'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  post '/register' do
    user = User.new(params)
    if user.save
      redirect '/login'
    else
      erb :'/user/new', locals: {user: user}
    end
  end

  post '/login' do
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect '/home'
    else
      redirect '/login'
    end
  end

  def current_user
    @current_user ||= User.find_by(id:session[:user_id])
  end

end
