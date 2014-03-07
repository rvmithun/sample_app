class SessionsController < ApplicationController

  def new
  end
#def create
 # user = User.find_by_email(params[:email])
  #if user && user.authenticate(params[:password])
    #session[:user_id] = user.id
   # redirect_to root_url, :notice => "Logged in!"
  #else
   # flash.now.alert = "Invalid email or password"
  #  render "new"
 # end
#end

#def destroy
 # session[:user_id] = nil
  #redirect_to root_url, :notice => "Logged out!"
#end
#end
 def create
    user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
    sign_in user
   redirect_back_or user
 else
  flash.now[:error] = 'Invalid email/password combination'
 render 'new'
 end
 end

  def destroy
   sign_out
  redirect_to root_url
  end
end
