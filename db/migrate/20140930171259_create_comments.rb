class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :comment
      t.belongs_to :post
      t.timestamps
    end
  end
end
