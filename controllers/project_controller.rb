require 'pry'
class App

  get '/project/new' do
    redirect '/login' unless current_user
    project = Project.new
    erb :'project/new',locals: {project: project}
  end

  get '/project/:id' do
    redirect '/login' unless current_user
    project = Project.find_by(id: params[:id])
    creator = User.find_by(id: project.user_id)
    erb :'project/project', locals:{project: project, creator: creator}
  end

  get '/project/:id/edit' do
    project = Project.find_by(id: params[:id])
    erb :'project/edit', locals: {project:project}
  end

  post '/project' do
    redirect '/login' unless current_user
    project = current_user.projects.new(params)
    if project.save
      redirect "/project/#{project.id}"
    else
      status 422
      erb :'project/new', locals: {project: project}
    end
  end

  put '/project/:id/edit' do
    project = Project.find_by(id: params[:id])
    if project.update_attributes(name:params[:name], start_date:params[:start_date], end_date:params[:end_date], description:params[:description])
      redirect "project/#{project.id}"
      else
       status 422
       erb :'project/edit', locals: {project: project}
     end
  end

  delete '/project/:id/delete' do
    project = Project.find(params[:id])
    project.destroy
    redirect '/home'
  end
def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
