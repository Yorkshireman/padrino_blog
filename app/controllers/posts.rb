PadrinoBlog::App.controllers :posts do

  post :create do
    @post = Post.new(params[:post])
    if @post.save
      @title = pat(:create_title, :model => "post #{@post.id}")
      flash[:success] = pat(:create_success, :model => 'Post')
      params[:save_and_continue] ? redirect(url(:posts, :index)) : redirect(url(:posts, :edit, :id => @post.id))
    else
      @title = pat(:create_title, :model => 'post')
      flash.now[:error] = pat(:create_error, :model => 'post')
      render 'posts/new'
    end
  end

  get :index do
    @posts = Post.order('created_at DESC').all
    render 'posts/index'
  end

  get :show, with: :id do
    @post = Post.find_by_id(params[:id])
    render 'posts/show'
  end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get '/example' do
  #   'Hello world!'
  # end
end
