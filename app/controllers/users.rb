PadrinoBlog::App.controllers :users do

  get :new do
    @user = User.new
    render 'users/new'
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end