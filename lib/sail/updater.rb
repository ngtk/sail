module Sail
  class Updater
    def self.run
      new.run
    end

    def run
      klass = "strategy/#{strategy_name}".constantize
      klass.new
    end
  end
end
