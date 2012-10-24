class ClicksController < ApplicationController
  # GET /shorteners
  # GET /shorteners.json
  def index
    @clicks = Shortener.find(params[:shortener_id]).clicks

    @unique_click_count = @clicks.count('ip_address', :distinct => true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clicks }
    end
  end
end
