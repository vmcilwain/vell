class AddEnabledToBlogCategories < ActiveRecord::Migration
  def change
    add_column :blog_categories, :enabled, :boolean
  end
end
