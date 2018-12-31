class QuotesController < ApplicationController

  before_action :set_quote,  only: [:show, :edit, :update, :destroy]
  after_action  :set_source, only: [:new, :edit]

  include SourcesHelper

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new(quote_params)
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote  = Quote.new(quote_params)
    @source = Source.find(quote_params[:source_id])

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
        format.js
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
        format.js   { render :new }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_quote
      @quote = Quote.find(params[:id])
    end

    def set_source
      @quote.build_source unless @quote.source
    end

    def quote_params
      params.fetch(:quote, {}).permit(
        :label,
        :text,
        :source_id,
        :original,
        :translation,
        :source_attributes => [
          :id,
          :_destroy,
          :label,
          :description,
          :link,
          :category_id,
          {:author_ids => []}
        ]
      )
    end
end
