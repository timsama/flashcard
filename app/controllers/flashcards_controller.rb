class FlashcardsController < ApplicationController
  def new
    @new_flashcard = Flashcard.new
    @flashcards = Flashcard.all
  end

  def destroy
    destroy_flashcard = Flashcard.find_by_id(params[:id])
    destroy_flashcard.destroy
    redirect_to :action => :index
    @flashcards = Flashcard.all
  end

  def create
    Flashcard.create(:keyword => params[:flashcard][:keyword], :kanji => params[:flashcard][:kanji])
    redirect_to :action => :index
    @flashcards = Flashcard.all
  end

  def edit
    @edit_flashcard = Flashcard.find_by_id(params[:id])
    @flashcards = Flashcard.all
  end

  def update
    update_flashcard = Flashcard.find_by_id(params[:id])
    update_flashcard.update(:keyword => params[:flashcard][:keyword], :kanji => params[:flashcard][:kanji])
    redirect_to :action => :index
    @flashcards = Flashcard.all
  end

  def index
    @flashcards = Flashcard.all
  end

  def test
  end
end
