class Api::ApplicationController < ActionController::API
  attr_accessor :current_user

  include ActionController::Serialization
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :deny_access!
  def authenticate_user!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

    user_email = options.blank? ? nil : options[:email]
    user = user_email && User.find_by(email: user_email)

    if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
      self.current_user = user
    else
      render json: error(401, '验证失败')
    end
  end

  def deny_access!
    render json: error(403, '无权限访问')
  end

  def error(status_code = 400, error_message = 'error', error_code = nil)
    {
        status: status_code,
        error:{
            code: error_code,
            message: error_message
        }
    }
  end

end
