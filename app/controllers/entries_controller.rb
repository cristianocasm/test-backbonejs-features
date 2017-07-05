class EntriesController < ApplicationController

  def index
    render json: Entry.all
  end

  def show
    render json: Entry.find(params[:id])
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
    render json: Entry.update(params[:id], params[:entry])
  end

  def destroy
    render json: Entry.destroy(params[:id])
  end

  private

  def entry_params
    params.require(:entry).permit(:name)
  end
end
