class CreateTextComponents < ActiveRecord::Migration
  def change
    create_table :text_components do |t|
      t.references :component, index: true
      t.text :text

      t.timestamps
    end
  end
end
