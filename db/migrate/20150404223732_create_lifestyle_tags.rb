class CreateLifestyleTags < ActiveRecord::Migration
  def change
    create_table :lifestyle_tags do |t|
      t.string :tag

      t.timestamps null: false
    end
  end
end
