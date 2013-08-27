module PiggybakVariants
  class Variant < ActiveRecord::Base
    self.table_name = "variants"

    acts_as_sellable
    belongs_to :product
    has_and_belongs_to_many :option_values

    attr_accessible :option_value_ids, :piggybak_sellable_attributes

    scope :available, joins(:piggybak_sellable).where(["sellables.active = ? AND (sellables.quantity > 0 OR sellables.unlimited_inventory = ?)",true,true]) 

    def admin_label
      "#{self.piggybak_sellable.sku}: #{self.piggybak_sellable.price}"
    end
  end
end