class AddTypeToBusinessesTags < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses_tags, :type, :string
  end
end
