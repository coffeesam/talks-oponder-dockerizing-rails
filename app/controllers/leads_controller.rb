class LeadsController < ApplicationController

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.create(params.permit(:email))
    redirect_to root_path, notice: "Thanks!"
  end

  def index
    @leads = Lead.all
  end
end