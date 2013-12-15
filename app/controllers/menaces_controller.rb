class MenacesController < ApplicationController
  def new
    @menace = Menace.new
  end

  def create
    @menace = Menace.new(params[:menace])
    if @menace.save
      MenaceMailer.created(@menace).deliver
      redirect_to @menace
    else
      render :new
    end
  end

  def show
    @menace = Menace.find_by_uuid(params[:id])
  end

  def track
    @menace = Menace.includes(:transition_logs).find_by_uuid(params[:id])
  end
end
