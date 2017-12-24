class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true, length: {minimum:2, maximum:20}
  validates :introdaction, length: {maximum:50}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :image

  has_many :books

  has_many :book_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

end
