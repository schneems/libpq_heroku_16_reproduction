require "pg"

connection_parameters = {
  host: "db",
  user: "postgres",
  connect_timeout: "15s",
}

conn = PG.connect(connection_parameters)
conn.exec("SELECT 'test'") do |result|
  puts "Succeeded"
end