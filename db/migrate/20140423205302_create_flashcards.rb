class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :keyword
      t.string :kanji

      t.timestamps
    end
  end
end
