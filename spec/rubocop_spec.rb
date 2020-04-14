# frozen_string_literal: true

require 'rails_helper'
require 'rubocop'

describe 'RuboCop' do
  before(:all) do
    $stdout = RubocopStringIO.new
    @result = RuboCop::CLI.new.run([Rails.root.to_s, '--color'])
  end

  after(:all) do
    $stdout = STDOUT
  end

  it 'must have no offenses' do
    expect(@result).to be_zero
  end
end

class RubocopStringIO < StringIO
  def write(*args)
    super STDOUT.write(*args)
  end
end
