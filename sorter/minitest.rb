require 'minitest/autorun'
require 'minitest/mock'
require './algos'


class Swap_test < Minitest::Test
	def setup
		@sorter = Sorter.new
	end

	def test_swap_normal
		before = @sorter.arr.clone
		@sorter.swap!(0,1)
		after = @sorter.arr
	
		assert_equal before[0], after[1]
		assert_equal before[1], after[1]
	end
	
	def
	
	end
end

