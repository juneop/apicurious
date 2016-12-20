class ResponsesController < ApplicationController
  
  URL = "https://data.sfgov.org/resource/sipz-fjte.json"

  def new
    @response = Response.new
  end

  def create
    find_response(params[:response][:business_name])
    @data = HTTParty.get(URL, query: {business_name: @response.format_name})
    Inspection.create_inspections(@data, @response)
    redirect_to @response
  end

  def show
    @response = Response.find(params[:id])
    @inspections = @response.inspections.order("inspection_date DESC")
  end

  private

    def whitelisted
      params.require(:response).permit(:business_name)
    end

    def find_response(name)
      if Response.find_by_business_name(name)
        @response = Response.find_by_business_name(name)
      else
        @response = Response.create(whitelisted)
      end
    end
end
