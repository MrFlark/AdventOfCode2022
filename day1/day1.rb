#!/usr/bin/ruby

# init array assuming we're starting with an empty elf inventory
# (no preceding newlines to indicate this)
calorieSums = [0]

File.foreach("./input.txt") {
    |line|
        if line == "\n" then # begin new elf inventory

            # this elf inventory starts as zero calories
            calorieSums.push(0)

        else # add to existing elf inventory

            # grab latest index so we don't have to keep track of a running index variable
            latestIndex = calorieSums.length() - 1

            # append parsed calorie int to existing elf inventory
            calorieSums[latestIndex] += Integer(line)

        end
}

# part 1
puts calorieSums.max()

# part 2
puts calorieSums.sort().last(3).sum()