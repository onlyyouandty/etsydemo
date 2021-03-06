class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def twitter
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
	end

	def google_oauth2
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
	end

	def linkedin
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
	end

end