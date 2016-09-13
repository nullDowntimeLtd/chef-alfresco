module Helpers
  # Establishes a connection at the give url with faraday
  # return faradayConnection
  def get_faraday_connection(url)
    new_connection = Faraday.new(url: url, headers: { 'Host' => host_inventory['hostname'] }) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    new_connection
  end
end
