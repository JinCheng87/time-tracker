require 'pry'
class App

  get '/home' do
    erb :'user/index',locals:{projects:current_user.projects.all}
  end

def current_user
    @current_user ||= User.find_by(id:session[:user_id])
  end
end