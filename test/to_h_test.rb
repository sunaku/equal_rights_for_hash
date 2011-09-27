require "test/unit"

require "equal_rights_for_hash"

class TestToH < Test::Unit::TestCase
  def test_converts_nil_into_hash
    assert_equal({}, nil.to_h)
  end

  def test_converts_real_hash_into_self
    real_hash = {:real => true}
    assert_same(real_hash, real_hash.to_h)
  end

  def test_converts_fake_hash_into_hash
    fake_hash = Object.new
    def fake_hash.to_h
      {:fake => true}
    end
    assert_kind_of(Hash, fake_hash.to_h)
    assert_equal({:fake => true}, fake_hash.to_h)
  end

  def test_converts_empty_array_into_hash
    assert_equal({}, [].to_h)
  end

  def test_converts_flat_even_array_into_hash
    assert_equal({1 => 2, 3 => 4}, [1, 2, 3, 4].to_h)
  end

  def test_converts_nested_even_array_into_hash
    assert_equal({1 => 2, 3 => 4}, [[1, 2], [3, 4]].to_h)
  end

  def test_converts_flat_odd_array_into_hash
    error = assert_raise(ArgumentError) { [1, 2, 3].to_h }
    assert_equal("odd number of arguments for Hash", error.message)
  end

  def test_converts_nested_odd_array_into_hash
    assert_equal({1 => 2, 3 => nil}, [[1, 2], [3]].to_h)
  end
end
