# frozen_string_literal: true

require 'docker'
require 'logger'

require 'regard/version'
require 'regard/module_injector'
require 'regard/modules/abstract_discover'

module Regard

  class Result
    attr_accessor :state, :output, :obj, :vuln

    def initialize
      state = :untested
      vuln = Regard::Vuln.new
    end
  end

  class Vuln
    attr_accessor :severity, :description, :solution,
                  :title, :tags, :references, :risk, :reflinks

    def initialize
      severity = 0
      title = 'Forgot to add title'
      description = 'Forgot to add description'
      solution = 'Information only.'
      tags = {}
      references = {}
      risk = {}
      reflinks = {}
    end
  end

  class Audit
    attr_accessor :log

    def initialize(url, logger = nil)
      Docker.url = url unless url.nil?
      modules = []
      modules.push File.expand_path('regard/modules', File.dirname(__FILE__))
      failed = load_modules(failed, modules, 'discover')
    end

    private

    def load_modules(failed, modules, name)
      modules.each do |dir|
        Dir["#{dir}/#{name}/*.rb"].each do |file|
          begin
            require file
          rescue SyntaxError => e
            failed << file
          end
        end
      end
      failed
    end

  end
end
