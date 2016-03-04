json.array!(@services) do |service|
  json.extract! service, :id, :name, :title, :type, :phone, :location, :website, :alias, :department, :cwid
  json.url service_url(service, format: :json)
end
