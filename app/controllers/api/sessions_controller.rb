class Api::SessionsController < Api::ApplicationController
  
  def destroy
    session.delete(current_user.id)
    sign_out(current_user)
    render :json => { :message => 'Sign out Successfully.' }, :status => 200
  end
end