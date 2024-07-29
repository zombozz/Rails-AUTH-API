class SessionsController < Devise::SessionsController
    respond_to :json
  
    private
  
    def respond_with(resource, _opts = {})
      render json: { message: 'Logged in successfully.' }, status: :ok
    end
  
    def respond_to_on_destroy
      log_out_success && return if current_user
  
      log_out_failure
    end
  
    def log_out_success
      render json: { message: "Logged out successfully." }, status: :ok
    end
  
    def log_out_failure
      render json: { message: "Something went wrong." }, status: :unauthorized
    end

    def destroy
        if current_user
          current_user.update(authentication_token: nil) # Or whatever method you use to revoke the token
          head :no_content
        else
          render json: { message: 'Not logged in.' }, status: :unauthorized
        end
    end
  end
  