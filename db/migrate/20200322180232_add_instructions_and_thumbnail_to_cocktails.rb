class AddInstructionsAndThumbnailToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :instructions, :string
    add_column :cocktails, :thumbnail, :string
  end
end
