class FlashcardsController < ApplicationController
  def view
    @flashcards = Flashcard.all
    @new_flashcard = Flashcard.new
  end

  def create
    Flashcard.create(:keyword => params[:flashcard][:keyword], :kanji => params[:flashcard][:kanji])
    redirect_to :back
  end

  def edit
  end

  def test
  end
end
