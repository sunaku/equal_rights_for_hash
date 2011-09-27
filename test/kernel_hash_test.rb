require "test/unit"

require "equal_rights_for_hash"

class TestKernelHash < Test::Unit::TestCase
  def test_converts_nil_into_hash
    assert_equal({}, Hash(nil))
  end

  def test_converts_real_hash_into_self
    real_hash = {:real => true}
    assert_same(real_hash, Hash(real_hash))
  end

  def test_converts_fake_hash_into_hash
    fake_hash = Object.new
    def fake_hash.to_hash
      {:fake => true}
    end
    assert_kind_of(Hash, Hash(fake_hash))
    assert_equal({:fake => true}, Hash(fake_hash))
    assert_equal(fake_hash.to_hash, Hash(fake_hash))
    assert_equal(fake_hash.to_h, Hash(fake_hash))
  end

  def test_converts_empty_array_into_hash
    assert_equal({}, Hash([]))
  end

  def test_raises_TypeError_on_failure
    error = assert_raise(TypeError) { Hash("bogus") }
    assert_equal("invalid value for Hash: bogus", error.message)
  end
end
