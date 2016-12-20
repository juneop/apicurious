class ResponsesController < ApplicationController

  def new
    @response = Response.new
  end

  def create
    url = "https://data.sfgov.org/resource/sipz-fjte.json"
    @data = HTTParty.get(url, query: {business_name: params[:response][:business_name]})
    @response = Response.create(whitelisted)
    create_violations(@data, @response)
    redirect_to @response
  end

  def show
    @response = Response.find(params[:id])
    @violations = @response.violations
  end

  private

    def whitelisted
      params.require(:response).permit(:business_name)
    end

    def create_violations(data, response)
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
