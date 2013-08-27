module PiggybakVariants
  class Option < ActiveRecord::Base
    self.table_name = "options"

    attr_accessible :name, :position, :product_id
    belongs_to :product
    has_many :option_values, :dependent => :destroy

    default_scope :order => "position ASC"

    accepts_nested_attributes_for :option_values, :allow_destroy => true
    attr_accessible :option_values_attributes, :allow_destroy => true
  end
end