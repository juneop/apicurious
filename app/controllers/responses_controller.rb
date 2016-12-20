class ResponsesController < ApplicationController
  URL = "https://data.sfgov.org/resource/sipz-fjte.json"

  def new
    @response = Response.new
  end

  def create
    @response = Response.create(whitelisted)
    @data = HTTParty.get(URL, query: {business_name: @response.format_name})
    Violation.create_violations(@data, @response)
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

end
