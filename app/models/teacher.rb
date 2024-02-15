class Teacher < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  belongs_to :institution
  has_one :subject
  has_many :quizzes
end
