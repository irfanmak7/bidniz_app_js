class AddSubmittedByToBusinessesTags < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses_tags, :submitted_by, :string
  end
end
