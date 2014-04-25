class FlashcardsController < ApplicationController



  def new
    @new_flashcard = Flashcard.new
    @flashcards = Flashcard.all
    @random_card = rand(Flashcard.count - 1) + 1

  end

  def destroy
    destroy_flashcard = Flashcard.find_by_id(params[:id])
    destroy_flashcard.destroy
    redirect_to :action => :index
    @flashcards = Flashcard.all
    @random_card = rand(Flashcard.count - 1) + 1

  end

  def create
    Flashcard.create(:keyword => params[:flashcard][:keyword], :kanji => params[:flashcard][:kanji])
    redirect_to :action => :index
    @flashcards = Flashcard.all
    @random_card = rand(Flashcard.count - 1) + 1

  end

  def edit
    @edit_flashcard = Flashcard.find_by_id(params[:id])
    @flashcards = Flashcard.all
    @random_card = rand(Flashcard.count - 1) + 1

  end

  def update
    update_flashcard = Flashcard.find_by_id(params[:id])
    update_flashcard.update(:keyword => params[:flashcard][:keyword], :kanji => params[:flashcard][:kanji])
    redirect_to :action => :index
    @flashcards = Flashcard.all
    @random_card = rand(Flashcard.count - 1) + 1

  end

  def index
    @random_card = rand(Flashcard.maximum('id')) + 1
    while not Flashcard.find_by_id(@random_card)
      @random_card = rand(Flashcard.maximum('id')) + 1
    end
    @flashcards = Flashcard.all
    @random_card = rand(Flashcard.count - 1) + 1

  end

  def test
    test_flashcard = Flashcard.find_by_id(params[:id])
    @answer_flashcard = Flashcard.new
    @answer_flashcard.kanji = test_flashcard.kanji
    @flashcards = Flashcard.all
    @random_card = rand(Flashcard.count - 1) + 1

  end

  def answer
    @random_card = rand(Flashcard.count - 1) + 1
    test_flashcard = Flashcard.find_by_id(params[:id])
    if params[:flashcard][:keyword] == test_flashcard.keyword
      redirect_to :action => :correct
    else
      redirect_to :action => :incorrect
    end
  end

  def correct
    @random_card = rand(Flashcard.maximum('id')) + 1
    while not Flashcard.find_by_id(@random_card)
      @random_card = rand(Flashcard.maximum('id')) + 1
    end
    @flashcards = Flashcard.all
  end

  def incorrect
    @random_card = rand(Flashcard.maximum('id')) + 1
    while not Flashcard.find_by_id(@random_card)
      @random_card = rand(Flashcard.maximum('id')) + 1
    end
    @correct_flashcard = Flashcard.find_by_id(params[:id])
    @flashcards = Flashcard.all
  end
end
