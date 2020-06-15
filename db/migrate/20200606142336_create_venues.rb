class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :email_address
      t.string :postcode
      t.text :bio
      t.string :website_lin
      t.string :instagram
      t.string :phone_number
      t.string :password_digest

      t.timestamps
    end
  end
end
