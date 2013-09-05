class Feedling < ActiveRecord::Base
  belongs_to :feed
  belongs_to :feedable, :polymorphic => true
end
