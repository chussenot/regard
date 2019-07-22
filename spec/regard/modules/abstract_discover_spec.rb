# frozen_string_literal: true

require 'spec_helper'

describe Regard::Modules::AbstractDiscoverModule do
  before(:all) do
    class SomeModule < Regard::Modules::AbstractDiscoverModule ; end
  end
  it "should override info method" do
    # expect(SomeModule.new.info).to raise_error(RuntimeError)
  end
end
