class Fact < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
  default_scope {order('updated_at DESC')}
end
