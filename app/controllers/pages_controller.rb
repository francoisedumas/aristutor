class PagesController < ApplicationController
  skip_before_action :authenticate_teacher!, only: :home
  def home
  end

  def components
  end

  def translation

  end
end
