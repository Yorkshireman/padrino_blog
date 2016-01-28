PadrinoBlog::App.controllers :users do

  get :new do
    @user = User.new
    render 'users/new'
  end

  post :create, params: [:name, :email, :password, :password_confirmation] do
    user = User.new(params[:user])
    user.save
    redirect('/', notice: "Signed up successfully!")
  end

end