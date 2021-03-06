class VideosController < ApplicationController

  def create
    video = Video.new(video_params)
    @note = Note.find(video.note_id)
    # respond_to do |format|
      if video.save
        #  format.html { redirect_to note_path(video.note_id) }
         redirect_to note_path(video.note_id)
        #  format.js
      else
        flash[:video_create_error] = "Error creating video"
        redirect_to note_path(video.note_id)
      end
    # end
  end

  def new
  end

  def update
    video = Video.find(params[:id])
    if video.update_attributes(video_params)
      redirect_to note_path(video.note_id)
    else
      flash[:video_update_error] = "Error updating video"
      render :edit
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def destroy
    video = Video.find(params[:id])
    Video.find(params[:id]).destroy
    redirect_to note_path(video.note_id)
  end

  private

  def video_params
    params.require(:video).permit(:title, :link, :note_id)
  end

end
