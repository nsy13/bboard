class AddIndexToTopicCategories < ActiveRecord::Migration[5.2]
  def change
    add_index :topic_categories, [:topic_id, :category_id], unique: true
  end
end
