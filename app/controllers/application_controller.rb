class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    locale = extract_locale_from_accept_language_header

    if locale && I18n.available_locales.include?(locale.to_sym)
      I18n.locale = extract_locale_from_accept_language_header
    end
  end

  protected
    def authenticate_inviter!
      require_admin
      super
    end

  private
    def extract_locale_from_accept_language_header
      if request.env['HTTP_ACCEPT_LANGUAGE']
        request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      end
    end

    def require_admin
      unless current_user && current_user.admin?
        flash[:error] = t "errors.unauthorized.page"
        redirect_to root_path
      end
    end

end
