class NotesController < ApplicationController

  #Probably don't need this.
  # def index
  #   @notes = Note.all
  # end

  def create
    note = Note.new(note_params)
    if note.save
      redirect_to note_path(note)
    else
      flash[:note_create_error] = note.errors.full_messages.to_sentence
      render :new
    end
  end

  def new
  end

  def show
    @note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    if note.update_attributes(note_params)
      redirect_to note_path(note)
    else
      flash[:note_update_error] = note.errors.full_messages.to_sentence
      render :edit
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def destroy
    Note.find(params[:id]).destroy
    # redirect_to 'users notes page'
  end

  private

  def note_params
    params.require(:note).permit(:title, :user_id)
  end

end
