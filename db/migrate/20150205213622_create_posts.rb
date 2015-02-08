<<<<<<< HEAD
  class CreatePosts < ActiveRecord::Migration
=======
class CreatePosts < ActiveRecord::Migration
>>>>>>> css-assignment
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
