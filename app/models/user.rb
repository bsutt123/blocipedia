class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :collaborators
  has_many :col_wikis, through: :collaborators, source: :wiki
  has_many :wikis

  enum role: [:standard, :premium, :admin]


end
