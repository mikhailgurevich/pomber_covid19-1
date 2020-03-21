require "pomber_covid19/version"
require "HTTParty"

module PomberCovid19
  BASE_URL = "https://pomber.github.io/covid19/timeseries.json"

  def self.find_by_region_name(region_name)
    response = HTTParty.get(BASE_URL)
    raise HttpRequestError if response.status != 200

    covid19_data = response[region_name.capitalize]
    raise RegionNotFoundError if covid19_data.nil?

    covid19_data
  end

  class HttpRequestError < StandardError
  end

  class RegionNotFoundError < StandardError
  end
end