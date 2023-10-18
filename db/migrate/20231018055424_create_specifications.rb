class CreateSpecifications < ActiveRecord::Migration[7.0]
  def change
    create_table :specifications do |t|
      t.integer :context_type
      t.string :context_text
      t.string :context_array

      t.timestamps
    end
  end
end
