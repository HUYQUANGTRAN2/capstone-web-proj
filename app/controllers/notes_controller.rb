class NotesController < ApplicationController
  before_action :require_sign_in, only: %i[new create edit update destroy]
  before_action :set_note, only: %i[show edit update destroy]

  # GET /notes or /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to notes_path, notice: "Note created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    if @note.update(note_params)
      redirect_to note_path(@note), notice: "Note updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy!

    respond_to do |format|
      format.html { redirect_to notes_path, status: :see_other, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def pinned
    @notes = Note.where(pinned: true).order(updated_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
     @note = Note.find(params[:id])
    end 

    # Only allow a list of trusted parameters through.
    def note_params
      params.expect(note: [ :title, :body, :pinned ])
      params.require(:note).permit(:title, :body, :pinned)
    end
end
