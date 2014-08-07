# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    Encoding.list.each do |enc|
      assert(RegexpM17N.non_empty?('.'.force_encoding(enc)))
    end
  end

  Encoding.list.each do |enc|
    name = "test_#{enc.name.downcase.tr('-','_')}"
    define_method name do
      str = '.'.force_encoding(enc)
      begin
        assert(RegexpM17N.non_empty?(str), "#{enc} matches empty")
      rescue RegexpError
        assert nil, "#{enc} raised RegexpError"
      end
    end
  end
end
