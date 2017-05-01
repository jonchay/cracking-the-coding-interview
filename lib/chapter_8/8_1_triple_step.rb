# 8.1 Triple Step
# A child is running up a staircase with n steps and can hop either 1, 2, or 3
#   steps at a time. Implement a method to count how many possible ways the
#   child can run up the stairs.
#

# This solution keeps a lookup table of precomputed steps. That is, if we've
#   already been on a certain step, we can look up the path count rather than
#   re-compute it. Without this optimization, the algorithm is something like
#   O(3^n) in time complexity.
#
class TripleStep
  attr_reader :iterations

  def initialize(top_step)
    @top_step = top_step
    @ways = 0
  end

  def count_paths(current_step = 0)
    return 0 if current_step > @top_step
    return 1 if current_step == @top_step

    count_paths(current_step + 1) +
      count_paths(current_step + 2) +
      count_paths(current_step + 3)
  end
end
