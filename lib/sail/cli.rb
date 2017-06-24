module Sail
  class CLI < Thor
    def create(filepath)
      config = Config.load(filepath)
      CronJobFile.create(config)
    end
  end
end
