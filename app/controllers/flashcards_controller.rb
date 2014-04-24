class FlashcardsController < ApplicationController
  def new
    @new_flashcard = Flashcard.new
  end

  def destroy
    destroy_flashcard = Flashcard.find_by_id(params[:id])
    destroy_flashcard.destroy
    redirect_to :action => :index
  end

  def create
    Flashcard.create(:keyword => params[:flashcard][:keyword], :kanji => params[:flashcard][:kanji])
    redirect_to :action => :index
  end

  def edit
    @edit_flashcard = Flashcard.find_by_id(params[:id])
  end

  def update
    update_flashcard = Flashcard.find_by_id(params[:id])
    update_flashcard.update(:keyword => params[:flashcard][:keyword], :kanji => params[:flashcard][:kanji])
    redirect_to :action => :index
  end

  def index
    @flashcards = Flashcard.all
  end

  def randomcard
    random_id = rand(Flashcard.count)
    redirect_to :action => :test, :id => random_id
  end

  def test
    test_flashcard = Flashcard.find_by_id(params[:id])
    @answer_flashcard = Flashcard.new
    @answer_flashcard.kanji = test_flashcard.kanji
  end

  def answer
    test_flashcard = Flashcard.find_by_id(params[:id])
    if params[:flashcard][:keyword] == test_flashcard.keyword
      redirect_to :action => :correct
    else
      redirect_to :action => :incorrect
    end
  end

  def correct
    @correct_flashcard = Flashcard.find_by_id(params[:id])
  end

  def incorrect
    @correct_flashcard = Flashcard.find_by_id(params[:id])
  end
end
