class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new 

  Rack::Attack.throttle("requests by ip", limit: 3, period: 2) do |request|
    request.ip
  end

  class Request < ::Rack::Request
    def subdomain
      host.split('.').first
    end
  end
end