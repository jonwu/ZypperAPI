class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.references :componentable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
