class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  def index
    render json: Entry.all
  end

  def show
    render json: @entry
  end

  def create
    entry = Entry.create(entry_params)

    if entry.persisted?
      render json: entry, status: :ok
    else
      render json: entry.errors, status: :unprocessable_entity
    end
  end

  def update
    render json: @entry.update(entry_params)
  end

  def destroy
    render json: @entry.destroy
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:id, :name, :winner)
  end
end
