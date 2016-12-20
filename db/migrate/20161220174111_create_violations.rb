class CreateViolations < ActiveRecord::Migration[5.0]
  def change
    create_table :violations do |t|
      t.datetime :inspection_date
      t.integer  :response_id
      t.integer  :inspection_score
      t.string   :inspection_id
      t.string   :risk_category
      t.string   :violation_description

      t.timestamps
    end
  end
end
