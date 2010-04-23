require "test/unit"

require "kernel_hash"

class Testkernel_hash < Test::Unit::TestCase
  def test_converts_nil_into_hash
    assert_equal({}, Hash(nil))
  end

  def test_converts_real_hash_into_hash
    real_hash = {:real => true}
    assert_equal(real_hash, Hash(real_hash))
  end

  def test_converts_fake_hash_into_hash
    fake_hash = Object.new
    def fake_hash.to_hash
      {:fake => true}
    end
    assert_equal(fake_hash.to_hash, Hash(fake_hash))
  end

  def test_converts_empty_array_into_hash
    assert_equal({}, Hash([]))
  end
end
