class Human < ApplicationRecord
  belongs_to :user
  validates :name, :cpf, :birth, :user, presence: true
  validates :name, length:{maximum:60}
  validates :cpf, length:{minimum:11} 
end
