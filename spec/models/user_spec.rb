require 'rails_helper'

describe User do
  include TestFactories

  describe '#favorited(post)' do
    xit 'returns `nil` if the user has not favourited the post' do
    end

    xit 'returns the appropriate favorite if it exists' do
    end
  end

  describe '.top_rated' do
    before do
      @user1 = create(:user_with_posts_and_comments, posts_count: 1, comments_count: 1)
      @user2 = create(:user_with_posts_and_comments, posts_count: 1, comments_count: 2)
    end

    it 'returns users ordered by posts + commments' do
      expect(User.top_rated).to eq [@user2, @user1]
    end

    it 'stores a `posts_count` on user' do
      users = User.top_rated
      expect(users.first.posts_count).to eq 1
    end

    it 'stores a `comments_count` on user' do
      users = User.top_rated
      expect(users.first.comments_count).to eq 2
    end

  end
end