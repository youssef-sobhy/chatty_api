class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :token, index: { unique: true }
      t.string :name
      t.integer :chats_count, default: 0

      t.timestamps
    end
  end
end
