class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  layout "landing", only: [:index]

  def index
  end

  def dashboard
  end
end
