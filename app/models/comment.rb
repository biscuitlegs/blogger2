class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author
  validates :body, presence: true, allow_blank: false
end
