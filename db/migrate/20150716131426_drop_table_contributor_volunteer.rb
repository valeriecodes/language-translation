class DropTableContributorVolunteer < ActiveRecord::Migration
  def change
    drop_table :volunteers
    drop_table :contributors
  end
end
