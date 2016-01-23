require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class PadrinoBlog::App::PostsHelperTest < Test::Unit::TestCase
  context "PadrinoBlog::App::PostsHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend PadrinoBlog::App::PostsHelper
    end

    should "return nil" do
      assert_equal nil, @helpers.foo
    end
  end
end
