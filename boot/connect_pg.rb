require "yaml"
require "erb"
require "active_record"
require "logger"
require "dotenv"

# Load environment variables from .env.dev
Dotenv.load('.env.dev')

def self.load_database_config(yaml)
  if File.exist?(yaml)
    erb_result = ERB.new(File.read(yaml)).result
    return YAML.load(erb_result, aliases: true) || {}
  end
  raise "Could not load database configuration. No such file - #{yaml}"
end

database_config = load_database_config("db/config.yml")
ActiveRecord::Base.establish_connection(
  database_config.fetch(
    ENV["APP_ENV"]
  )
)
ActiveRecord::Base.logger = Logger.new($stdout)

# Check the connection by executing a simple query
begin
  ActiveRecord::Base.connection.execute("SELECT 1")
  puts "Database connection established successfully!"
rescue ActiveRecord::NoDatabaseError => e
  puts "Database does not exist: #{e.message}"
rescue ActiveRecord::ConnectionNotEstablished => e
  puts "Connection could not be established: #{e.message}"
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
