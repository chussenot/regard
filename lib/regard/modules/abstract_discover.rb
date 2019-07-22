# frozen_string_literal: true

module Regard
  module Modules
    class AbstractDiscoverModule < Injector
      attr_accessor :data

      def info
        raise "#{self.class.name} doesn't implement `handle_command`!"
      end

      def run
        raise "#{self.class.name} doesn't implement `handle_command`!"
      end
    end
  end
end
