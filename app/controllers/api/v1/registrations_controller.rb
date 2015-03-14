class Api::V1::RegistrationsController < Devise::RegistrationsController

  skip_before_filter :authenticate_user!, :only => [:create]
  skip_before_filter :authenticate_user_from_token!, :only => [:create]

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        render :json => { user: { email: resource.email, :auth_token => resource.authentication_token } }, success: true, status: :created
        # respond_with resource, location: after_sign_up_path_for(resource)
      else
        expire_data_after_sign_in!
        # respond_with resource, location: after_inactive_sign_up_path_for(resource)
        render :json => { :message => 'Cannot authenticate user.' }, :success => false, :status => 401
      end
    else
      clean_up_passwords resource
      render :json => { :message => 'Error in creating user.' }, :success => false, :status => 400
      # respond_with resource
    end
  end

  protected

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

end
