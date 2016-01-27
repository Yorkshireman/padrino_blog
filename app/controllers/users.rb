PadrinoBlog::App.controllers :users do

  get :new do
    @user = User.new
    render 'users/new'
  end

  post :create do
    user = User.new(name: params["name"], email: params["email"], password: params["password"], password_confirmation: params["password_confirmation"])
    user.save
    redirect('/')
    # redirect('/', notice: "Signed up successfully!")
  end


  # private

  # def user_params
  #   params.require(:user).permit(:name, :password, :password_confirmation)
  # end

end