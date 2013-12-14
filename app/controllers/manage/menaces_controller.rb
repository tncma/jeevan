class Manage::MenacesController < ApplicationController
  before_filter :authenticate_user!
  layout 'manage'

  def index
    @menaces = Menace.all
  end
end
