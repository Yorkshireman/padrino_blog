PadrinoBlog::App.controllers :posts do

  get :new do
    @post = Post.new
    render 'posts/new'
  end

  post :create do
    post = Post.new(params[:post])
    post.user = current_user
    if post.save
      puts Post.all.count
      puts Post.last.inspect
      redirect('/posts', notice: "Post Posted!")
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
  
end
