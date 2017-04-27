# Write a method to replace all spaces in a string with '%20'. You may assume that the string
# has sufficient space at the end to hold the additional characters.
#

def urlify(str, length)
  new_str = ''

  str.each_char.each_with_index do |c, i|
    break if i == length
    new_str << (c == ' ' ? '%20' : c)
  end

  new_str
end
