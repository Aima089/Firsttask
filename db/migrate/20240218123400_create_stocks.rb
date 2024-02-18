class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.date :date
      t.string :description
      t.integer :stock_type
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
