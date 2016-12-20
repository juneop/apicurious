class Violation < ApplicationRecord

  belongs_to :response

  def self.create_violations(data, response)
    data.each do |v|
      Violation.create!(response_id: response.id,
                    inspection_date: v["inspection_date"],
                   inspection_score: v["inspection_score"],
                      inspection_id: v["inspection_id"],
                      risk_category: v["risk_category"],
              violation_description: v["violation_description"])
    end
  end

end
