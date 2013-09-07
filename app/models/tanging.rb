class Tanging < ActiveRecord::Base
  belongs_to :tangent
  belongs_to :tangable, :polymorphic => true
end
