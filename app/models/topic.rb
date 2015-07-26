class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : where(public: true) }
  scope :publicly_visible -> {where(public: true)}
  scope :privately_visible -> {where(public: false)}
end
