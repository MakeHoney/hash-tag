class CreateJoinTableClubHashtag < ActiveRecord::Migration[5.2]
  def change
    create_join_table :clubs, :hashtags do |t|
      t.index [:club_id, :hashtag_id]
      t.index [:hashtag_id, :club_id]
    end
  end
end
