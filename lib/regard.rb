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

end
