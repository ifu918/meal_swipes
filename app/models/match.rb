class Match < ApplicationRecord
  # Direct associations

  belongs_to :creator,
             :class_name => "User",
             :foreign_key => "seller"

  # Indirect associations

  # Validations

end
