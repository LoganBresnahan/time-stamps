class StampsController < ApplicationController

  # def index
  # end

  def create
    stamp = Stamp.new(stamp_params)
    if stamp.save
      redirect_to stamp_path(stamp)
    else
      flash[:stamp_create_error] = stamp.errors.full_messages.to_sentence
      render :new
    end
  end

  def new
  end

  def show
    @stamp = Stamp.find(params[:id])
  end

  def update
    stamp = Stamp.find(params[:id])
    if stamp.update_attributes(stamp_params)
      redirect_to stamp_path(stamp)
    else
      flash[:stamp_update_error] = stamp.errors.full_messages.to_sentence
      render :edit
    end
  end

  def edit
    @stamp = Stamp.find(params[:id])
  end

  def destroy
    Stamp.find(params[:id]).destroy
    #redirect_to 'note page'
  end

  private

  def stamp_params
    params.require(:stamp).permit(:stamp, :body, :note_id)
  end

end
