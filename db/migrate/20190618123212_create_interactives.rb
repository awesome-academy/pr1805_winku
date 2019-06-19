class CreateInteractives < ActiveRecord::Migration[5.2]
  def change
    create_table :interactives do |t|
      t.integer :active_id
      t.integer :passive_id
      t.integer :action

      t.timestamps
    end
  end
end
