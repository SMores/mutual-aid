class AddApprovedToAnnouncement < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :approved, :boolean
  end
end
