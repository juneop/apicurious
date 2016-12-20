module ResponsesHelper

  def valid_inspection(inspection)
    if inspection.inspection_score
      render "responses/inspection_table"
    end
  end

end
