LogDeTareas::App.controllers :group do
  
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
		 @list= Group.all
     render 'group/index'
  end
  
  get :new do      
      @new_group = Group.new(params['group_name'], current_account)      
      redirect '/group'
  end
  
  get :create do
      redirect '/group_create'
  end
  
 

end
