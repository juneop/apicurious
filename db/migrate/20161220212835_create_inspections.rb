class CreateInspections < ActiveRecord::Migration[5.0]
  def change
    create_table :inspections do |t|
      t.integer :response_id
      t.string  :inspection_date
      t.string  :inspection_score
      t.string  :inspection_id

      t.timestamps
    end
  end
end
