class AddMoviesCountReviewsCountToUsers < ActiveRecord::Migration

  def self.up
    add_column :users, :movies_count,  :integer, default: 0
    add_column :users, :reviews_count, :integer, default: 0

    User.find_each do |user|
      User.reset_counters(user.id, :movies, :reviews) # [NOTE] :movies_count では無い。。
    end
  end

  def self.down
    remove_columns :users, :movies_count, :reviews_count
  end

end
