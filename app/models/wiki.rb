class Wiki < ActiveRecord::Base
  has_many :collaborators
  has_many :user_collaborators, through: :collaborators, source: :user
  belongs_to :user
end
