#!/usr/bin/env ruby

def steps(offsets, mut)
    retval = 0
    inc = 0
    ctr = 0
    until ctr >= offsets.size or ctr < 0 do
        retval += 1
        inc = offsets[ctr]
        offsets[ctr] = mut.call(offsets[ctr])
        ctr += inc
    end
    return retval
end

# Read input
$input = ARGF.readlines.map { |s| s.to_i}

# Part 1
puts steps $input.dup, lambda { |x| x + 1 }

# Part 2
puts steps $input.dup, lambda { |x| x < 3 ? x + 1 : x - 1 }
