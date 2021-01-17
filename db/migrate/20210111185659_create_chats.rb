class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.integer :number
      t.belongs_to :application, foreign_key: true
      t.integer :messages_count, default: 0

      t.timestamps
    end
  end
end
