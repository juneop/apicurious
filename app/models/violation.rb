class Violation < ApplicationRecord
  require 'date'

  belongs_to :inspection

  def self.create_violations(data, inspection)
    data.each do |v|
      if inspection.inspection_id == v["inspection_id"]
        Violation.create!(inspection_id: inspection.id,
                   business_address: v["business_address"],
                      risk_category: v["risk_category"],
              violation_description: v["violation_description"])
      else
        next
      end
    end
  end

end
