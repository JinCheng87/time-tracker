class App

  get '/project/:id/work_session/new' do
    project_id = params[:id]
    work_session = WorkSession.new
    erb :'work_session/new', locals: {work_session: work_session, project_id: project_id}
  end

  get '/project/:id/work_session/:session_id' do
    work_session = WorkSession.find_by(id:params[:session_id])
    project_id = params[:id]
    erb :'work_session/work_session',locals: {work_session:work_session,project_id:project_id}
  end

  get '/project/:id/work_session' do
    work_sessions = Project.find_by(id: params[:id]).work_sessions.all
    project_name = Project.find(params[:id]).name
    erb :'work_session/work_session_list',locals: { work_sessions: work_sessions,project_name: project_name,project_id:params[:id]}
  end

  get '/project/:project_id/work_session/:work_session_id/edit' do
    work_session = WorkSession.find_by(id: params[:work_session_id])
    erb:'work_session/edit', locals: {work_session: work_session, project_id:params[:project_id],work_session_id: params[:work_session_id]}
  end

  post '/project/:id/work_session/new' do
    redirect '/login' unless current_user
    work_session = WorkSession.new({date:params[:date], start_time:params[:start_time], end_time:params[:end_time], is_billable:params[:is_billable], description:params[:description],project_id:params[:id]})
    if work_session.save
      redirect "project/#{params[:id]}/work_session/#{work_session.id}"
    else
      status 422
      erb :'work_session/new',locals:{work_session: work_session, project_id: params[:id]}
    end
  end

  put '/project/:project_id/work_session/:work_session_id/edit' do
    work_session = WorkSession.find_by(id: params[:work_session_id])
    if work_session.update_attributes(date: params[:date],start_time: params[:start_time], end_time: params[:end_time], description: params[:description])
      redirect "/project/#{params[:project_id]}/work_session/#{params[:work_session_id]}"
        else
          status 422
          erb :'work_session/edit', locals: { work_session:work_session }
        end
  end

  delete '/project/:project_id /work_session/:work_session_id/delete' do
    work_session = WorkSession.find_by(id: params[:work_session_id])
    work_session.destroy
    redirect "/project/#{params[:project_id]} /work_session"
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end