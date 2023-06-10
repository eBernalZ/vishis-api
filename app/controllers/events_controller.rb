class EventsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_event, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[ create update destroy ]
  # before_action :authenticate_user!

  # GET /events
  def index
    @events = Event.accessible_by(current_ability)
    # @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      # authorize! :manage, @event
    end

    # Only allow a list of trusted parameters through.
    def event_params
      # params.fetch(:event, {})
      params.require(:event).permit(:event_type, :start_date, :end_date, :name, :description, :status, :verified, :author_id, :checker_id, :language, :event_status)
    end
end
