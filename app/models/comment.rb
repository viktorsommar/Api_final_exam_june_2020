class Comment < ApplicationRecord
  validates :comment
  belongs_to :article
  belongs_to :user
end
