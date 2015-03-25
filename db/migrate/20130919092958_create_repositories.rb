class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :link

      t.timestamps
    end
  end
end
