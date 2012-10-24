class ShortenersController < ApplicationController
  # GET /shorteners
  # GET /shorteners.json
  def index
    @shorteners = Shortener.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shorteners }
    end
  end

  # GET /shorteners/1
  # GET /shorteners/1.json
  def show
    @shortener = Shortener.find_by_url_hash(params[:id])
    redirect_to @shortener.url
  end

  # GET /shorteners/new
  # GET /shorteners/new.json
  def new
    @shortener = Shortener.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shortener }
    end
  end

  # GET /shorteners/1/edit
  def edit
    @shortener = Shortener.find(params[:id])
  end

  # POST /shorteners
  # POST /shorteners.json
  def create
    @shortener = Shortener.new(:url => params[:shortener][:url])
    @shortener.password = params[:shortener][:password]

    respond_to do |format|
      if @shortener.save
        format.html { redirect_to @shortener, notice: 'Shortener was successfully created.' }
        format.json { render json: @shortener, status: :created, location: @shortener }
      else
        format.html { render action: "new" }
        format.json { render json: @shortener.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shorteners/1
  # PUT /shorteners/1.json
  def update
    @shortener = Shortener.find(params[:id])

    respond_to do |format|
      if @shortener.update_attributes(params[:shortener])
        format.html { redirect_to @shortener, notice: 'Shortener was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shortener.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shorteners/1
  # DELETE /shorteners/1.json
  def destroy
    @shortener = Shortener.find(params[:id])
    @shortener.destroy

    respond_to do |format|
      format.html { redirect_to shorteners_url }
      format.json { head :no_content }
    end
  end
end
