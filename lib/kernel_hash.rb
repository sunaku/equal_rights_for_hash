# See http://redmine.ruby-lang.org/issues/show/3131

module Kernel
  unless method_defined? :Hash
    def Hash(value)
      if value.respond_to? :to_hash
        value.to_hash
      elsif value.nil? or Array(value).empty?
        {}
      else
        raise ArgumentError, "invalid value for Hash: #{value}"
      end
    end
  end
end
