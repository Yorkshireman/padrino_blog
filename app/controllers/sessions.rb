PadrinoBlog::App.controllers :sessions do

  get :login do
    render '/sessions/login'
  end

end