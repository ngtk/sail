require 'forwardable'

module Sail
  class Config
    extend Forwardable

    VAILD_KEYS = [
      :commiter,
      :repo_url,
      :pull_request,
      :frequency,
      :time,
    ].freeze
    REQUIRED_KEYS = [
      :repo_url,
    ]

    def_delegators :@yaml, *VAILD_KEYS

    def self.load(filepath)
      yaml = YAML.load_file(filepath)
      yaml = yaml.with_indifferent_access
      obj = new(yaml)
      obj.validate
    end

    def initialize(yaml)
      @yaml = yaml
    end

    private

    def validate
      invalid_keys = @yaml.keys - VALID_KEYS.map(&:to_s)
      if invalid_keys.present?
        raise "You have invalid keys: #{invalid_keys.join(", ")}"
      end

      missing_keys = REQUIRED_KEYS.map(&:to_s) - @yaml.keys
      if missing_keys.present?
        raise "You have missing keys: #{missing_keys.join(", ")}"
      end
    end
  end
end
