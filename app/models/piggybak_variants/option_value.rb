module PiggybakVariants
  class OptionValue < ActiveRecord::Base
    self.table_name = "option_values"

    attr_accessible :name, :position, :option_id
    has_and_belongs_to_many :variants, join_table: 'option_values_variants'
    belongs_to :option, :inverse_of => :option_values

    scope :ordered, :order => "position ASC"
    scope :hash_ordered, :include => :option, :order => "options.position ASC, option_values.position ASC"

    def admin_label
      "#{self.option.name}: #{self.name}"
    end
  end
end