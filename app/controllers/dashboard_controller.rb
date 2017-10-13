class DashboardController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
      Song,
      params[:filterrific]
    ) or return
    @songs = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end
end
