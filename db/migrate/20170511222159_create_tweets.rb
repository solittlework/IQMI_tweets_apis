class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.integer "followers" 
      t.text "message"
      t.decimal "sentiment", :precision => 3, :scale => 1
      t.string "user_handle"
      t.timestamps
    end
  end
end
