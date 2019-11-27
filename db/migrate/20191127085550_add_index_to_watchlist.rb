class AddIndexToWatchlist < ActiveRecord::Migration[5.2]
  def change
    add_index :watchlists, [:user_id, :topic_id], unique: true
  end
end
