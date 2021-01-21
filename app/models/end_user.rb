class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number,:is_active, presence: true       
end
