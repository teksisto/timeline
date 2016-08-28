class QuoteVersionsController < ApplicationController
  before_action :set_quote_version, only: [:show, :edit, :update, :destroy]

  # GET /quote_versions
  # GET /quote_versions.json
  def index
    @quote_versions = QuoteVersion.all
  end

  # GET /quote_versions/1
  # GET /quote_versions/1.json
  def show
  end

  # GET /quote_versions/new
  def new
    @quote_version = QuoteVersion.new
  end

  # GET /quote_versions/1/edit
  def edit
  end

  # POST /quote_versions
  # POST /quote_versions.json
  def create
    @quote_version = QuoteVersion.new(quote_version_params)

    respond_to do |format|
      if @quote_version.save
        format.html { redirect_to @quote_version, notice: 'Quote version was successfully created.' }
        format.json { render :show, status: :created, location: @quote_version }
      else
        format.html { render :new }
        format.json { render json: @quote_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_versions/1
  # PATCH/PUT /quote_versions/1.json
  def update
    respond_to do |format|
      if @quote_version.update(quote_version_params)
        format.html { redirect_to @quote_version, notice: 'Quote version was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote_version }
      else
        format.html { render :edit }
        format.json { render json: @quote_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_versions/1
  # DELETE /quote_versions/1.json
  def destroy
    @quote_version.destroy
    respond_to do |format|
      format.html { redirect_to quote_versions_url, notice: 'Quote version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_version
      @quote_version = QuoteVersion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_version_params
      params.require(:quote_version).permit(:quote_id, :language, :text, :created_at, :updated_at)
    end
end
