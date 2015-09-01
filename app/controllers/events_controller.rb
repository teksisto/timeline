# coding: utf-8
class EventsController < ApplicationController
  
  before_action :set_event,  only: [:show, :edit, :update, :destroy]
  before_action :set_events, only: [:index, :fullscreen]
  
  # GET /events
  # GET /events.json
  def index
    
    @events_by_year = Event.by_year(@events)

    @fullscreen = false

    # Поле render_method сделано multiply=true только потому что
    # браузер его красиво рисует. Приводит это к тому, что можно
    # одновременно выбрать несколько методов, поэтому и нужна
    # следующая строчка.
    render_method = params[:render_method] && params[:render_method].first
    
    if render_method.present? && Event::RENDER_METHODS.include?(render_method)
      @partial = render_method
    else
      @partial = Event::RENDER_METHODS.first
    end
    
  end

  def fullscreen
    @fullscreen = true
    render layout: 'vis_fullscreen'
  end
  
  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new(event_params)
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_events
      @events = Event.all
      if params[:source_ids] && params[:source_ids].first.present?
        @events = @events.from_sources(params[:source_ids])
      end
      if params[:category_ids] && params[:category_ids].first.present?
        @events = @events.from_categories(params[:category_ids])
      end
      @events = @events.sorted
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:label,
                                    :start_date,
                                    :end_date,
                                    :description,
                                    :source_id,
                                    :age,
                                    :period,
                                    :location_id,
                                    :details_url,
                                    {:category_ids => []})
    end
end
