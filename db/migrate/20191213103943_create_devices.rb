class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :status
      t.string :current_consumption
      t.string :location

      t.timestamps
    end
  end
end
