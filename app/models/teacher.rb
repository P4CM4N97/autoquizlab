class Teacher < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  belongs_to :institution
  has_one :subject
  has_many :student_subjects, through: :subject
  has_many :students, through: :student_subjects
  has_many :quizzes
end
