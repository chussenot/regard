# frozen_string_literal: true

class GetDockerInfo < Regard::Modules::AbstractDiscoverModule
  def info
    'Docker info discovery module'
  end

  def run
    Regard::Result.new.tap do |sp|
      sp.obj = Docker.info
      sp.output = sp.obj.map { |k, v| "#{k}=#{v}" }.join("\n")
      sp.state = :info
    end
  end
end
