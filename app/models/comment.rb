class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  default_scope { order('updated_at ASC') }

  validates :body, length: {minimum: 5}, presence: true
  validates :user_id, presence: true
  
  after_create :send_favorite_emails
 
  private
 
  def send_favorite_emails
    post.favorites.each do |favorite|
      if user_id != favorite.user_id && favorite.user.email_favorites?
        FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
      end
    end
  end

  def should_receive_update_for?(favorite)
    user_id != favorite.user_id && favorite.user.email_favorites?
  end
end
