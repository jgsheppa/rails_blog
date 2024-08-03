require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "draft? returns true for drafted blog post" do
    assert posts(:draft).draft?
  end

  test "draft? returns false for a published blog post" do
    refute posts(:published).draft?
  end

  test "draft? returns false for a scheduled blog post" do
    refute posts(:scheduled).draft?
  end

  test "published? returns true for published blog post" do
    assert posts(:published).published?
  end

  test "published? returns false for a drafted blog post" do
    refute posts(:draft).published?
  end

  test "published? returns false for a scheduled blog post" do
    refute posts(:scheduled).published?
  end

  test "scheduled? returns true for scheduled blog post" do
    assert posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for a published blog post" do
    refute posts(:published).scheduled?
  end

  test "scheduled? returns false for a draft blog post" do
    refute posts(:draft).scheduled?
  end
end
