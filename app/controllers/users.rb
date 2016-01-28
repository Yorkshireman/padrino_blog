PadrinoBlog::App.controllers :users do

  get :new do
    @user = User.new
    render 'users/new'
  end

  post :create do
    user = User.new(params[:user])
    
    if user.save
      redirect('/sessions/new', notice: "Signed up successfully! Please Log in")
    elsif (params[:user][:password_confirmation] != "") && (params[:user][:password] != params[:user][:password_confirmation])
      redirect('/users/new', notice: "Password and Password Confirmation do not match. Please try again.")
    else
      redirect('/users/new', notice: "Please make sure you fill in all fields.")
    end
  end

end