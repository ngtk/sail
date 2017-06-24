require "spec_helper"

RSpec.describe Sail do
  it "has a version number" do
    expect(Sail::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
