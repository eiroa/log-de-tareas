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

  get :new , :with => :name do
      Group.new(:name, current_account)
      render 'group/list'
  end

  get :list do
      render 'group/list'
  end
  
  get :create do
      render 'group/create'
  end
  
  get '/' do
      render 'group/list'
  end
  

end
