class Post < ApplicationRecord
    include Rails::Sharding::ShardableModel
end
