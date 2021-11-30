json.extract! setting_api, :id, :email_access, :token_access, :created_at, :updated_at
json.url setting_api_url(setting_api, format: :json)
