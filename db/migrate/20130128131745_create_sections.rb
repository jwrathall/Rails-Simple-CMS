class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
	  t.references :page
	  t.string "name", :limit => 50
	  t.integer "position"
	  t.boolean "is_visible", :default => false
	  t.string "content_type", :limit => 100
	  t.text "content"
      t.timestamps
    end
    add_index("sections","page_id")
  end
end
