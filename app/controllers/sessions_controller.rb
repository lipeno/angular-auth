class SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => current_user
  end

  #def destroy
  #  super
  #end

  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_out
    render :status => 200,
           :json => current_user
  end

  def failure
    render :json => {:success => false, :error => "Invalid username/password combination" }
  end

  def show_current_user
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => current_user
  end
end
