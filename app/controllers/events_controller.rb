class EventsController < ApplicationController

  before_action :set_event,  only: [:show, :edit, :update, :destroy]
  before_action :set_events, only: [:index, :fullscreen]

  # GET /events
  # GET /events.json
  def index
    # Rails.logger.debug @events_filter.inspect.red
    render layout: @events_filter.layout
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
        format.js
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js
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
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_events
      @events_filter = EventsFilter.new(events_filter_params)
      @events = @events_filter.events
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.fetch(:event, {}).permit(
        :label,
        :start_date,
        :end_date,
        :description,
        :source_id,
        :age,
        :period,
        :location_id,
        :link,
        {:category_ids => []}
      )
    end

    def events_filter_params
      params.fetch(:events_filter, {}).permit(
        {:source_ids    => []},
        {:category_ids  => []},
        {:render_method => []},
        :group_by_country,
        :fullscreen
      )
    end

end
