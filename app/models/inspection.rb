class Inspection < ApplicationRecord

  belongs_to :response

  has_many :violations

  def self.create_inspections(data, response)
    data.each do |i|
      if Inspection.find_by_inspection_id(i["inspection_id"])
        next
      else
        Inspection.create!(response_id: response.id,
                    inspection_date: format_date(i["inspection_date"]),
                   inspection_score: i["inspection_score"],
                      inspection_id: i["inspection_id"])
      end
    end
    set_violations(data)
  end

  def self.set_violations(data)
    Inspection.all.each do |inspection|
      Violation.create_violations(data, inspection)
    end
  end

  def self.format_date(inspection_date)
    date = DateTime.strptime(inspection_date, '%Y-%m-%dT%H:%M:%S')
    date = date.strftime("%m/%d/%Y")
  end

end
