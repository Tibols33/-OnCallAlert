class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :department
  validates :last_name, presence: true
  validates :first_name, presence: true
  # validates :address, presence: true
  # validates :phone_number, presence: true
  # validates :job_title, presence: true
  # validates :grade, presence: true, inclusion: { in: %w(Professeur(e) Docteur(e) Mme M)}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :deplacement, { uncalled: 0, called: 1, accepted: 2, rejected: 3 }
end
