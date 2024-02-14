class Subject < ApplicationRecord
  belongs_to :institution
  belongs_to :teacher
  has_many :student_subjects
  has_many :students, through: :student_subjects
  has_many :quizzes, through: :teachers
end
