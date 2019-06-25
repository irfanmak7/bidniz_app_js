class CreateBusinessesTags < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses_tags do |t|
      t.integer :business_id
      t.integer :tag_id
    end
  end
end
