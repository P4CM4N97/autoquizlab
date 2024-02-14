class Student < ApplicationRecord
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  belongs_to :institution
  has_many :student_subjects
  has_many :subjects, through: :student_subjects
  has_many :teachers, through: :subjects
end
