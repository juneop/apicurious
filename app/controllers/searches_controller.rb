class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create
    url = "https://data.sfgov.org/resource/sipz-fjte.json?business_name=#{params([:name])}"
    data = HTTParty.get(url).parsed_response
  end

end
