require 'pry'

class Sorter
	attr_accessor :arr
	
	def initialize(array=[1,2,3])
		@arr = array
		@compared_num = 0
		@swapped_num = 0
		@counter = set_counter_closure #クロージャ練習
	end
	
	def reset_count()
		puts "@compared_num = " + @compared_num.to_s
		puts "@swapped_num = " + @swapped_num.to_s
		puts @arr.to_s
	
		@compared_num = 0
		@swapped_num = 0
		@counter = set_counter_closure
	end
	
	def generate_random_array(num=10)
		@arr = []
		num.times do |i|
			@arr[i] = i
		end
		@arr.shuffle!
	end

	def swap!(i, j)
		raise "It is nil" if @arr[i].nil? || @arr[j].nil?
		
		tmp = @arr[j]
		@arr[j] = @arr[i]
		@arr[i] = tmp
		
		@swapped_num += 1
		
		puts "((swapped)) " + i.to_s + " & " + j.to_s + " : " + @arr[i].to_s + " , " + @arr[j].to_s + "  ARRAY : " +@arr.to_s
	end
	
	def which_is_bigger?(i, j)
		raise "It is nil" if @arr[i].nil? || @arr[j].nil?

		@compared_num += 1
		puts "((compared)) " + i.to_s + " & " + j.to_s + " . @arr[#{i}] : " + @arr[i].to_s + " , " + "@arr[#{j}] : " + @arr[j].to_s
		
		if arr[i] > arr[j]
			return i
		elsif arr[i] < arr[j]
			return j
		elsif arr[i] === arr[j]
			return nil
		else
			raise "Doubtful natural number"
		end
	end

	def bubble_sort()
		(@arr.count - 1).times do |i|
			tmp_swapped_flag = false
			
			(@arr.count - 1).times do |j|
				if which_is_bigger?(j,j+1) === j
					swap!(j,j+1)
					tmp_swapped_flag = true
				end
			end
			
			unless tmp_swapped_flag
				break
			end
		end

		reset_count()
	end
	
	def meta_quick_sort(left=0, right=@arr.count-1)
		quick_sort(left, right)
		reset_count()
	end
	
	def set_counter_closure
		count = 0
		
		f = lambda {
			count+= 1
			puts "count : " + count.to_s
		}
		
		f
	end
	
	# 不完全
	def quick_sort(left, right)
		if left < right
			@counter.call()
		
			i = left 
			j = right

			pivot = get_pivot(i,i+(j-i)/2,j)
			
			puts "pivot : " + pivot.to_s + "th value : " + @arr[pivot].to_s

			loop do
				# iよりpivotがデカい間インクリメント
				loop do
					if which_is_bigger?(i, pivot) != pivot
						break
					end
					
					i += 1
				end
				
				# pivotよりjがでかい間デクリメント
				loop do
					if which_is_bigger?(j, pivot) != j
						break
					end
					
					j -= 1
				end
				
				break if i >= j
				
				swap!(i, j)
				i += 1
				j -= 1
			end
			
			quick_sort(left, i-1)
			quick_sort(j+1, right)
		end
	end
	
	# 中間値を返す
	def get_pivot(i,j,k)
		if @arr[i] < @arr[j]
			if @arr[j] < @arr[k]
				return j
			elsif @arr[k] < @arr[i]
				return i
			else
				return k
			end
		else
			if @arr[k] < @arr[j]
				return j
			elsif @arr[i] < @arr[k]
				return i
			else
				return k
			end
		end
	end
	
	
	def heapsort()
		for i in 0..(@arr.length/2) do
			j = (@arr.length/2)-i
			downheap(j, @arr.length-1)
		end
		
		puts "((((heap created))))"
		puts @arr.to_s
		puts "start sort"
		
		for i in 1..(@arr.length-1) do
			j = @arr.length - i
			swap!(0, j)
			downheap(0, j-1)
		end
		
		reset_count()
	end
	
	def downheap(parent, last)
		loop do
			child = 2*parent + 1
			
			if child > last
				break
			end
			
			if child < last && which_is_bigger?(child, child+1) === (child+1)
				child += 1
			end
			
			if which_is_bigger?(child, parent) === parent
				break
			end
			
			swap!(child, parent)
			
			parent = child
		end
	end
	
	
	def oreore_sort(left,right)
		if left>light
			@counter.call()
		
			i = left 
			j = right
		
			pivot = get_pivot(i,i+(j-i)/2,j)
			
			
		end
	end
end





