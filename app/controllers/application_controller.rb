class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json'}
  skip_before_filter  :verify_authenticity_token
  
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  rescue_from Exception, with: :generic_exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found


  def authenticate_user_from_token!
    user_email = request.headers["X-API-EMAIL"].presence
    user_auth_token = request.headers["X-API-TOKEN"].presence
    user = user_email && User.find_by_email(user_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, user_auth_token)
      sign_in(user, store: false)
    else
      invalid_authentication
    end
  end

  protected
    def invalid_authentication
      render json: { success: false, message: 'Error with authenticating user' }, status: 401
    end

    def invalid_query
      render json: { success: false, message: 'Invalid Query' }, status: 400
    end

    def render_json_delete
      render json: { success: true, message: 'Successful delete' }, status: 204
    end

    def render_object(object, status)
      render json: object, success: true, status: status
    end

    def record_not_found(error)
      respond_to do |format|
        format.json { render :json => {:error => error.message}, :status => 404 }
      end
    end

    def generic_exception(error)
      respond_to do |format|
        format.json { render :json => {:error => error.message}, :status => 500 }
      end
    end
end
