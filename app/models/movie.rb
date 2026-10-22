class Movie < ApplicationRecord
    validates :title, presence: { message: "não pode ficar em branco" }
    validates :release_year, numericality: { only_integer: true, greater_than: 1887 }
    validates :rating, inclusion: { in: 1..5, message: "deve ser de 1 a 5" }
  end