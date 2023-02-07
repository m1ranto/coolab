class Collaborator < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
end
