class DropTopicAndResponse < ActiveRecord::Migration
  def change
    drop_table :topics
    drop_table :responses
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :type
      t.integer :topic_id
      t.integer :user_id

      t.timestamps
    end
  end
end
