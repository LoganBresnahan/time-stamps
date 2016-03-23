class TimeStampsController < ApplicationController

  # def index
  # end

  def create
    time_stamp = TimeStamp.new(time_stamp_params)
    if time_stamp.save
      redirect_to time_stamp_path(time_stamp)
    else
      flash[:time_stamp_create_error] = time_stamp.errors.full_messages.to_sentence
      render :new
    end
  end

  def new
  end

  def show
    @time_stamp = TimeStamp.find(params[:id])
  end

  def update
    time_stamp = TimeStamp.find(params[:id])
    if time_stamp.update_attributes(time_stamp_params)
      redirect_to time_stamp_path(time_stamp)
    else
      flash[:time_stamp_update_error] = time_stamp.errors.full_messages.to_sentence
      render :edit
    end
  end

  def edit
    @time_stamp = TimeStamp.find(params[:id])
  end

  def destroy
    TimeStamp.find(params[:id]).destroy
    #redirect_to 'note page'
  end

  private

  def time_stamp_params
    params.require(:time_stamp).permit(:stamp, :body, :note_id)
  end

end
