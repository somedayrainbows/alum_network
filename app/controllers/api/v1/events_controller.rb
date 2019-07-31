class Api::V1::EventsController < ApplicationController

  def index
    render json: EventSerializer.new(Event.all)
  end

  def show
    render json: EventSerializer.new(Event.find(params[:id]))
  end

  def create
    render json: EventSerializer.new(Event.create(event_params))
  end

  def update
    render json: Event.update(params[:id], event_params)
  end

  def destroy
    render json: Event.delete(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :event_notes)
  end

end
