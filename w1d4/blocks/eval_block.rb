def eval_block *args, &proc
  puts "NO BLOCK GIVEN!" unless block_given?
  proc.call(*args)
end

eval_block(1,2,3) { |a,b,c|
  puts "#{a}, #{b}, #{c}"
}

eval_block("Kerry", "Washington", 23) do |fname, lname, score|
  puts "#{lname}, #{fname} won #{score} votes."
end

eval_block(1,2,3,4,5) do |*args|
  args.inject(:+)
end
# => 15

eval_block(1, 2, 3)
# => "NO BLOCK GIVEN"