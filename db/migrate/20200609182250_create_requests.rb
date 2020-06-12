class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :payment
      t.integer :number_of_hours
      t.boolean :accept, default: nil
      t.references :venue, null: false, foreign_key: true
      t.references :availability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
