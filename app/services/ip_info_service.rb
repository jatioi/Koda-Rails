class IpInfoService
  def self.fetch_ip_info(ip)
    # Fetch the IP address using the IPify API
    # https://ipify.org/
    response = RestClient.get("https://ipinfo.io/#{ip}/geo")
    JSON.parse(response.body)
  end
end