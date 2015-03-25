class AddTeamIdToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :team_id, :integer
  end
end
