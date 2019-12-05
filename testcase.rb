require "pg"

connection_parameters = {
  host: "db",
  user: "postgres",
  connect_timeout: "15s",
}

begin
  conn = PG.connect(connection_parameters)
  conn.exec("SELECT 'test'") do |result|
    puts "🙀🙀🙀 PG can load which means libpg5.12.1 is not used"
  end
rescue => e
  puts e.message
  puts "👍👍👍 Success!!! An error is expected" if e.message.include?("invalid integer value")
end