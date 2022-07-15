class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :country
      t.integer :awards

      t.timestamps
    end
  end
end
