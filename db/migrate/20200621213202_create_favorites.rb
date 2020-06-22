# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :item
      t.timestamps
    end
  end
end
