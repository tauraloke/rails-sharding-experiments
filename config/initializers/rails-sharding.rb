
Rails::Sharding.setup do |config|
    config.establish_all_connections_on_setup = true
    config.extend_active_record_scope = true
end
