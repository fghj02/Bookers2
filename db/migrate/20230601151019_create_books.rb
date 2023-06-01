class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :book_name
      t.text :book_body
      t.user_id :integer

      t.timestamps
    end
  end
end
