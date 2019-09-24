class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :originalURL
      t.string :shortURL
      t.string :hashedURL

      t.timestamps
    end
  end
end
