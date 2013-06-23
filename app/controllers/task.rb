LogDeTareas::App.controllers :task do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  get :index do
      @group = Group.find_by_id(params['group_id'])
      @list= TaskTemplate.find_all_by_group(@group)
      render 'task/index'
  end
  
  

end
