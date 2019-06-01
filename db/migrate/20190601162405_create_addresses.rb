class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.belongs_to :location, foreign_key: true

      t.timestamps
    end
  end
end
