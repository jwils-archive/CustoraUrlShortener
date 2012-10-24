class ClicksController < ApplicationController
  # GET /shorteners
  # GET /shorteners.json
  def index
    @shorteners = Shortener.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shorteners }
    end
  end
end
