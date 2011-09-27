module Kernel
  def Hash(value)
    value.to_h
  rescue
    raise TypeError, "invalid value for Hash: #{value}"
  end
end

class Object
  def to_h
    if respond_to? :to_hash
      to_hash
    elsif respond_to? :all? and not all? {|item| item.respond_to? :to_ary }
      Hash[*self]
    else
      Hash[self]
    end
  end
end

class NilClass
  def to_h
    {}
  end
end
