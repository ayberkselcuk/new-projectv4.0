# frozen_string_literal: true

# question
class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
end
