module Piggybak
  module ActsAsSellableWithVariants
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_sellable_with_variants
        has_many :variants, :dependent => :destroy, :class_name => "::PiggybakVariants::Variant"
        has_many :options, dependent: :destroy, :class_name => "::PiggybakVariants::Option"

        accepts_nested_attributes_for :variants, :allow_destroy => true
        accepts_nested_attributes_for :options, :allow_destroy => true
        attr_accessible :variants_attributes, :options_attributes #, :allow_destroy => true
        validates_associated_bubbling :variants
        
      end      
    end
  end
end

::ActiveRecord::Base.send :include, Piggybak::ActsAsSellableWithVariants