class Comment < ApplicationRecord
  validates_presence_of :comment
  belongs_to :article
  belongs_to :user
end
