class AddEnabledToBlogCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :blog_categories, :enabled, :boolean
  end
end
