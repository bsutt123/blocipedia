class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_initialize :default_member

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  enum role: [:member, :premium, :admin]


  def set_role(role_name)
    self.role = role_name
  end
  private

  def default_member
    self.role = "member"
  end

end
