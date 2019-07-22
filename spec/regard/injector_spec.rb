# frozen_string_literal: true

require 'spec_helper'

describe Regard::Modules::Injector do
  before(:all) do
    class Foo < Regard::Modules::Injector ; end
    class Bar < Regard::Modules::Injector ; end
  end

  it 'has foo bar classes' do
    expect(Regard::Modules::Injector.modules).to include Foo
    expect(Regard::Modules::Injector.modules).to include Bar
  end
end
