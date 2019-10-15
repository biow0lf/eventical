class ApplicationController < ActionController::Base
  include Authenticating

  protect_from_forgery

  before_action :set_raven_context

  protected

  def analytics
    Analytics.new(current_character)
  end

  def character_settings
    Setting.for_character(current_character)
  end

  def set_raven_context
    Raven.user_context(id: current_character&.uid)
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
