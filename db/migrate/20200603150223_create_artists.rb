class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :username
      t.string :email_address
      t.string :artist_genre
      t.text :bio
      t.string :phone_number
      t.string :instagram
      t.string :spotify
      t.string :profile_picture
      t.string :password_digest

      t.timestamps
    end
  end
end
