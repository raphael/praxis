module Praxis

  class Route
    attr_accessor :verb, :path, :version, :name, :prefixed_path, :options

    def initialize(verb, path, version='n/a', name:nil, prefixed_path:nil, **options)
      @verb = verb
      @path = path
      @version = version
      @name = name
      @options = options
      @prefixed_path = prefixed_path
    end

    def describe
      result = {
        verb: verb,
        path: path.to_s,
        version: version
      }
      result[:name] = name unless name.nil?
      result[:options] = options if options.any?
      result
    end

  end

end
