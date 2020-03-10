class PagesController < ApplicationController
  skip_before_action :login_required
  before_action :logout_required

  def home; end

  private

  def logout_required
    redirect_to words_url if current_user
  end
end
