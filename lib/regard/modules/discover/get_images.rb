# frozen_string_literal: true

class GetImages < Regard::Modules::AbstractDiscoverModule
  def info
    'Image discovery module'
  end

  def run
    Regard::Result.new.tap do |sp|
      sp.obj = Docker::Image.all
      sp.output = sp.obj.map { |k, v| "#{k}=#{v}" }.join("\n")
      sp.state = :info
    end
  end
end