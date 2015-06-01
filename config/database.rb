# set the database based on the current environment
database_name = "traffic-spy-#{TrafficSpy::Server.environment}"
db = URI.parse(ENV['DATABASE_URL'] || "postgres://user:password@localhost/database")

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :port     => db.port,
  :username => db.user,
  :password => db.password,
  :database => "#{database_name}",
  :encoding => 'utf8'
)
