# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.string :description
      t.string :image
      t.integer :price
      t.string :contact
      t.boolean :available
      t.references :user
      t.timestamps
    end
  end
end
