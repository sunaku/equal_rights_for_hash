require "equal_rights_for_hash/version"

module Kernel
  def Hash(value)
    value.to_h
  end
end

class Object
  def to_h
    if respond_to? :to_hash
      to_hash
    elsif respond_to? :to_ary and not all? {|item|
      item.respond_to? :to_ary and item.size <= 2 }
    then
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
