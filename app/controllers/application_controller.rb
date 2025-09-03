class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_arabic_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :role])
  end

  def set_arabic_locale
    I18n.locale = :ar
  end

  # أضف هذه الدالة إذا لم تكن موجودة
  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: 'غير مصرح لك بالوصول إلى هذه الصفحة'
    end
  end
end
