# app/controllers/authentication_controller.rb
# The authentication controller should expose an /auth/login endpoint
# that accepts user credentials and returns a JSON response with the result.
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated
  def authenticate
    auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end

# Notice how slim the authentication controller is,
# we have our service architecture to thank for that.
# Instead, we make use of the authentication controller
# to piece everything together, to control authentication.