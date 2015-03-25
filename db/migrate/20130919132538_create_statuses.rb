class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :status do |t|
      t.string :content

      t.timestamps
    end
  end
end
