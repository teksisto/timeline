class TermsController < ApplicationController
  before_action :set_term, only: [:show, :edit, :update, :destroy]

  # GET /terms
  # GET /terms.json
  def index
    @terms = Term.all.order('label ASC')
  end

  # GET /terms/1
  # GET /terms/1.json
  def show
  end

  # GET /terms/new
  def new
    @term = Term.new(term_params)
  end

  # GET /terms/1/edit
  def edit
  end

  # POST /terms
  # POST /terms.json
  def create
    @term   = Term.new(term_params)
    @source = Source.find(term_params[:source_id])

    respond_to do |format|
      if @term.save
        format.html { redirect_to @term, notice: 'Term was successfully created.' }
        format.json { render :show, status: :created, location: @term }
        format.js
      else
        format.html { render :new }
        format.json { render json: @term.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def select

    params.permit(:term_id, :source_id)

    @term = Term.find(params[:term_id])
    @source = Source.find(params[:source_id])
    @source.terms << @term

    respond_to do |format|
      format.js { render :create }
    end

  end

  # PATCH/PUT /terms/1
  # PATCH/PUT /terms/1.json
  def update
    respond_to do |format|
      if @term.update(term_params)
        format.html { redirect_to @term, notice: 'Term was successfully updated.' }
        format.json { render :show, status: :ok, location: @term }
      else
        format.html { render :edit }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terms/1
  # DELETE /terms/1.json
  def destroy
    @term.destroy
    respond_to do |format|
      format.html { redirect_to terms_url, notice: 'Term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term
      @term = Term.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def term_params
      params.require(:term).permit(:label, :text, :source_id)
    end
end
