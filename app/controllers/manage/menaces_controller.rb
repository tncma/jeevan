class Manage::MenacesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @menaces = Menace.all
  end

  def submitted
    @menaces = Menace.submitted
    render :template => "manage/menaces/index"
  end

  def accepted
    @menaces = Menace.accepted
    render :template => "manage/menaces/index"
  end

  def assigned
    @menaces = Menace.assigned
    render :template => "manage/menaces/index"
  end

  def rejected
    @menaces = Menace.rejected
    render :template => "manage/menaces/index"
  end

  def finished
    @menaces = Menace.finished
    render :template => "manage/menaces/index"
  end

  def accept
    @menace = Menace.find_by_uuid(params[:id])
    if @menace.accept
      redirect_to submitted_manage_menaces_path, notice: "Menace was accepted."
    else
      redirect_to submitted_manage_menaces_path, alert: "Menace could not be accepted."
    end

  end

  def assign
    @menace = Menace.find_by_uuid(params[:id])
    if @menace.assign
      redirect_to accepted_manage_menaces_path, notice: "Menace was assigned."
    else
      redirect_to accepted_manage_menaces_path, alert: "Menace could not be assigned."
    end
  end

  def reject
    @menace = Menace.find_by_uuid(params[:id])
    if @menace.reject
      redirect_to submitted_manage_menaces_path, notice: "Menace was rejected."
    else
      redirect_to submitted_manage_menaces_path, alert: "Menace could not be rejected."
    end
  end

  def finish
    @menace = Menace.find_by_uuid(params[:id])
    if @menace.finish
      redirect_to assigned_manage_menaces_path, notice: "Menace was finished."
    else
      redirect_to assigned_manage_menaces_path, alert: "Menace could not be finished."
    end
  end
end
