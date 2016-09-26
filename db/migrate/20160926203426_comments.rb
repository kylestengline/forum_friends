class Comments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |c|
      c.text :content

      c.timestamps
    end
  end
end
