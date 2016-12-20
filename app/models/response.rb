class Response < ApplicationRecord

  has_many :inspections
  has_many :violations, through: :inspections

  def format_name
    words = self.business_name.split(" ")
    words.each do |w|
      w = w.capitalize!
    end
    words.join(" ")
  end

end
