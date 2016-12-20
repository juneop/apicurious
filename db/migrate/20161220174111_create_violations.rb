class CreateViolations < ActiveRecord::Migration[5.0]
  def change
    create_table :violations do |t|
       t.string  :business_address
       t.string  :risk_category
       t.string  :violation_description
       t.string :inspection_id

      t.timestamps
    end
  end
end
