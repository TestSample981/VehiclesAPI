class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :plate_number, null: false
      t.string :vehicle_type
      t.string :make
      t.integer :production_year
      t.integer :user_id
      t.timestamps
    end
  end
end
