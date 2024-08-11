require_relative 'boot_http'

run Rack::Cascade.new [SrvApi]

