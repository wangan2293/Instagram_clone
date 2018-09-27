class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :topic_id
      t.string :comment_id

      t.timestamps
    end
  end
end
