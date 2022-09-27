class Demande < ApplicationRecord
  has_one_attached :document
  has_one_attached :preuve
end
