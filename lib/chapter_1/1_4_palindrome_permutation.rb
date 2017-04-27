class PalindromePermutation
  def self.check(str)
    raise ArgumentError if str == ''

    table = {}
    new_str = ''

    str.each_char do |c|
      next if c == ' '
      new_str << c
      table[c] = (table[c] || 0) + 1
    end

    counts = table.values.sort

    if new_str.length.even?
      counts.all?(&:even?)
    else
      counts[0] == 1 && counts[1..-1].all?(&:even?)
    end
  end
end
