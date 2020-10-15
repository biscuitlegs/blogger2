class AddPaperclipFieldsToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :image_file_name,    :text
    add_column :articles, :image_content_type, :text
    add_column :articles, :image_file_size,    :integer
    add_column :articles, :image_updated_at,   :datetime
  end
end
