class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.text :comment, null: false
      t.float :all_rating, null: false, default: 0
      t.float :rating1, null: false, default: 0
      t.float :rating2, null: false, default: 0
      t.float :rating3, null: false, default: 0
      t.float :rating4, null: false, default: 0
      t.references  :user, null: false, foreign_key: true
      t.references  :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
