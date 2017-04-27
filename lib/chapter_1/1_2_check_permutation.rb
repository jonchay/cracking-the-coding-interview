# Store counts of the first string
#

class PermutationChecker

  def self.check(str_a, str_b)
    return false if str_a.length != str_b.length

    table = {}
    str_a.each_char { |c| table[c] = (table[c] || 0) + 1 }
    str_b.each_char { |c| table[c] = (table[c] || 0) - 1 }

    table.values.uniq == [0]
  end

end
