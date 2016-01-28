PadrinoBlog::App.controllers :sessions do

  get :new do
    render '/sessions/new'
  end

  post :create do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user] = user
      redirect('/', notice: "Successfully signed in!")
    else
      redirect('/sessions/new', notice: "One or more errors prevented you from logging-in")
    end
  end

end