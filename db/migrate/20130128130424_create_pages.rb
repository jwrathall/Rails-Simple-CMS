class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :subject
      t.string "name", :limit => 50
      t.integer "position"
      t.boolean "is_visible", :Default => false
      t.string "permalink", :limit => 100 
      t.timestamps
    end
    add_index("pages","subject_id")
    add_index("pages","permalink")
  end
end
