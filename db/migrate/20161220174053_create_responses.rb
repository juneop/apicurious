class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :business_name
      t.string :business_address

      t.timestamps
    end
  end
end
