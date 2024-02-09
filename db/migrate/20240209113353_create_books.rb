class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
    add_index :books, :title
  end
end
