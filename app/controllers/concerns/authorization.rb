module Authorization
  extend ActiveSupport::Concern
  include Pundit::Authorization

  included do
    protect_from_forgery with: :exception
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

	private

	def user_not_authorized
		flash[:notice] = "You are not authorized."
		redirect_to(request.referrer || root_path)
	end
end
