class AddVideoToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :video, :string
  end
end
