module ResponsesHelper

  def get_yelp(response)
    "https://www.yelp.com/biz/#{yelpify_name(response)}-san-francisco"
  end

  def yelpify_name(response)
    response = dashify_name(response)
    remove_aps(response)
  end

  def dashify_name(response)
    name = response.business_name.split(" ")
    name.join("-")
  end

  def remove_aps(response)
    response = response.gsub("'", "")
    response.gsub("-LLC", "")
  end

  def no_inspections(response)
    if response.inspections.size == 0
      render "responses/nothing_to_show"
    end
  end

end
