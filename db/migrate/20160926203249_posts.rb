class Posts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |p|
      p.string :title
      p.text :content

      p.timestamps
    end
  end
end
