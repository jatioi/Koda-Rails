class IpService
  def self.fetch_ip_address
    # Fetch the IP address using the IPify API
    # https://ipify.org/
    response = RestClient.get('https://api.ipify.org/?format=json')
    JSON.parse(response.body)['ip']
  end
end