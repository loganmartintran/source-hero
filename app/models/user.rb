class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 25}

  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimium: 3, maximum: 254}

  validates :password,
            presence: true,
            uniqueness: {case_sensitive: true},
            length: {minimum: 8, maximum: 500}

end
