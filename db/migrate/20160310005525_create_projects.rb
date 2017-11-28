class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :repo_url
      t.string :live_url
      t.string :description
    end
  end
end
