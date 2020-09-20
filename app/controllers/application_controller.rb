class ApplicationController < ActionController::Base
  before_action :set_locale

  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end

  def default_url_options
    #defaultのURL設定言語を変更
    {locale: I18n.locale}
  end
  

  private
  def set_locale
    #設定言語を変更する
    I18n.locale = params[:locale] || I18n.default_locale
  end
end

