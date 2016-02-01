PadrinoBlog::App.controllers :sessions do
  get :new do
    render '/sessions/new'
  end

  post :create do
    user = User.find_by(email: params[:email])
    if user_exists_and_password_is_correct? user
      session[:user] = user
      redirect('/', notice: "Successfully signed in!")
    else
      redirect('/sessions/new', notice: "Email or password incorrect")
    end
  end

  get :destroy do
    session[:user] = nil
    redirect('/', notice: "Logged out successfully")
  end
end