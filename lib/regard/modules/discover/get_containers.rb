# frozen_string_literal: true

class GetContainers < Regard::Modules::AbstractDiscoverModule
  def info
    'Container discovery module'
  end

  def run
    Regard::Result.new.tap do |sp|
      sp.obj = Docker::Container.all(all: true)
      sp.output = sp.obj.map { |k, v| "#{k}=#{v}" }.join("\n")
      sp.state = :info
    end
  end
end
