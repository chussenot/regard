# frozen_string_literal: true

module Regard
  module Modules
    # Inject inherited modules
    class Injector
      def self.modules
        @modules ||= []
      end

      def self.inherited(klass)
        @modules ||= []
        @modules << klass
      end
    end
  end
end
