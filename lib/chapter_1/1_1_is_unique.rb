#
# Is Unique: Implement an algorithm to determine if a string has all unique characters.
# What if you cannot use a data structure?
def unique?(str)
  s = Set.new
  str.each_char do |c|
    return false if s.include?(c)
    s << c
  end
  true
end

def unique_without_set?(str)
  for i in (0..str.length)
    for j in (i+1..str.length)
      return false if str[i] == str[j]
    end
  end

  true
end
