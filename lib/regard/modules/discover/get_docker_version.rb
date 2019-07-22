# frozen_string_literal: true

class GetDockerVersion < Regard::Modules::AbstractDiscoverModule
  def info
    'Docker version discovery module'
  end

  def run
    Regard::Result.new.tap do |sp|
      sp.obj = Docker.version
      sp.output = sp.obj.map { |k, v| "#{k}=#{v}" }.join("\n")
      sp.state = :info
    end
  end
end
