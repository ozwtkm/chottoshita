require 'minitest/autorun'
require './algos'

def train(n)
  if n == 1
    nil
  elsif n == 2
    ""
  elsif n == 3
    "aaaaa"
  elsif n == 4
    "exe"
  else
    "exea"
  end
end

class TrainTest < Minitest::Test
  def test_train
    assert_nil train(1)
    assert_empty train(2)
    assert_match /[a]+/, train(3)
    assert_includes ["exe","fe"], train(4)
    assert_equal 'exea', train(100)
  end
end




class Swap!test < Minitest::Test
	def setup
		@sorter = Sore
	end

	def test_swap
		
	end



	def swap!(i, j)
		raise "It is nil" if @arr[i].nil? || @arr[j].nil?
		
		tmp = @arr[j]
		@arr[j] = @arr[i]
		@arr[i] = tmp
		
		@swapped_num += 1
		
		puts "((swapped)) " + i.to_s + " & " + j.to_s + " : " + @arr[i].to_s + " , " + @arr[j].to_s + "  ARRAY : " +@arr.to_s
	end
end


