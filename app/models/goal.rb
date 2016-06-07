class Goal < ActiveRecord::Base
  include Commentable
  validates :status, :user, :completion, :title, presence: true
  validates :completion, :inclusion => 0..100
  belongs_to :user


end
