class TableOfContentsController < ApplicationController
  before_action :set_table_of_content, only: [:show, :edit, :update, :destroy]

  # GET /table_of_contents
  # GET /table_of_contents.json
  def index
    @table_of_contents = TableOfContent.all
  end

  # GET /table_of_contents/1
  # GET /table_of_contents/1.json
  def show
  end

  # GET /table_of_contents/new
  def new
    @table_of_content = TableOfContent.new
  end

  # GET /table_of_contents/1/edit
  def edit
  end

  # POST /table_of_contents
  # POST /table_of_contents.json
  def create
    @table_of_content = TableOfContent.new(table_of_content_params)

    respond_to do |format|
      if @table_of_content.save
        format.html { redirect_to @table_of_content, notice: 'Table of content was successfully created.' }
        format.json { render :show, status: :created, location: @table_of_content }
      else
        format.html { render :new }
        format.json { render json: @table_of_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table_of_contents/1
  # PATCH/PUT /table_of_contents/1.json
  def update
    respond_to do |format|
      if @table_of_content.update(table_of_content_params)
        format.html { redirect_to @table_of_content, notice: 'Table of content was successfully updated.' }
        format.json { render :show, status: :ok, location: @table_of_content }
      else
        format.html { render :edit }
        format.json { render json: @table_of_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_of_contents/1
  # DELETE /table_of_contents/1.json
  def destroy
    @table_of_content.destroy
    respond_to do |format|
      format.html { redirect_to table_of_contents_url, notice: 'Table of content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table_of_content
      @table_of_content = TableOfContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_of_content_params
      params.require(:table_of_content).permit(:source)
    end
end
