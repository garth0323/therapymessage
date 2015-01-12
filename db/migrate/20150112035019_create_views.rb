class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :message_id
      t.integer :user_id

      t.timestamps
    end
  end
end
