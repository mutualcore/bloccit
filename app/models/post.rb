class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  mount_uploader :image, ImageUploader

  default_scope { order('rank DESC')}
  scope :ordered_by_title, -> { reorder(title: :asc) }
  scope :ordered_by_reverse_created_at, -> { reorder(created_at: :asc) }

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  # validates :topic, presence: true
  # validates :user, presence: true

  after_create :create_vote

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age_in_days

    update_attribute(:rank, new_rank)
  end

  private

  def create_vote
    @post = self
    user.votes.create(value: 1, post: @post)
  end

end
