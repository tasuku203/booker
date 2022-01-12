class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      
      t.string :title
      t.string :body

      t.timestamp
    end
  end
end
