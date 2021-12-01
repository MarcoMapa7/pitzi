module ApiHelper

  def connect_api(action = "get", url = "", params = [])
    require 'net/http'
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)

    case action
      when 'get'
        request = Net::HTTP::Get.new(uri.request_uri)
      when 'post'
        request = Net::HTTP::Post.new(uri.request_uri)
      when 'put'
        request = Net::HTTP::Put.new(uri.request_uri)
      when 'del'
        request = Net::HTTP::Delete.new(uri.request_uri)
    end

    request['X-User-Email'] = SettingApi.last.email_access
    request['X-User-Token'] = SettingApi.last.token_access
    request.set_form_data(params)

    response = http.request(request)
    {'status'=> response.header.code, 'msg' => response.body.present? ? JSON.parse(response.body) : nil}
  end
end
