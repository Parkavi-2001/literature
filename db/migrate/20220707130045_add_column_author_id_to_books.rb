class AddColumnAuthorIdToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :author_id, :integer, index: true
  end
end
