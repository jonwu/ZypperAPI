class AddTitleToComponent < ActiveRecord::Migration
  def change
    add_column :components, :title, :string
  end
end
