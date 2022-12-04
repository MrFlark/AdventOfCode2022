#!/usr/bin/ruby

# move key
# ----
# A = opponent rock
# B = opponent paper
# C = opponent scissors
# ----
# X = rock
# Y = paper
# Z = scissors
# ----

# returns a str 'win', 'draw', or 'lose' (from your perspective)
def outcome(opponent_move, my_move)
    case opponent_move
    when "A"
        # their rock vs my rock
        if my_move == "X" then return "draw"
        # their rock vs my paper
        elsif my_move == "Y" then return "win"
        # their rock vs my scissors
        else return "lose" end
    when "B"
        # their paper vs my rock
        if my_move == "X" then return "lose"
        # their paper vs my paper
        elsif my_move == "Y" then return "draw"
        # their paper vs my scissors
        else return "win" end
    when "C"
        # their scissors vs my rock
        if my_move == "X" then return "win"
        # their scissors vs my paper
        elsif my_move == "Y" then return "lose"
        # their scissors vs my scissors
        else return "draw" end
    end
end

# rock move => score += 1
# paper move => score += 2
# scissors move => score += 3
move_scores = {
    "X" => 1,
    "Y" => 2,
    "Z" => 3
}

# won round => score += 6
# draw round => score += 3
# lost round => score += 0
round_scores = {
    "win" => 6,
    "draw" => 3,
    "lose" => 0
}

# part 1

score = 0

File.foreach("./input.txt") {
    |line|
        moves = line.split(" ")
        opponent_move = moves[0]
        my_move = moves[1]

        score += move_scores[my_move]

        # determine winner
        round_outcome = outcome(opponent_move, my_move)

        score += round_scores[round_outcome]
}

puts "part 1 score:"
puts score
puts "\n"

# part 2

def determine_move(opponent_move, desired_outcome)
    case desired_outcome
    when "X" # lose
        case opponent_move
        when "A" # their rock
            return "Z" # pick scissors
        when "B" # their paper
            return "X" # pick rock
        when "C" # their scissors
            return "Y" # pick paper
        end
    when "Y" # draw
        case opponent_move
        when "A" # their rock
            return "X" # pick rock
        when "B" # their paper
            return "Y" # pick paper
        when "C" # their scissors
            return "Z" # pick scissors
        end
    when "Z" # win
        case opponent_move
        when "A" # their rock
            return "Y" # pick paper
        when "B" # their paper
            return "Z" # pick scissors
        when "C" # their scissors
            return "X" # pick rock
        end
    end
end

# X => i lose
# Y => draw
# Z => i win

part2Score = 0

File.foreach("./input.txt") {
    |line|
        moves = line.split(" ")
        opponent_move = moves[0]
        desired_outcome = moves[1]

        my_move = determine_move(opponent_move, desired_outcome)

        part2Score += move_scores[my_move]

        # determine winner
        round_outcome = outcome(opponent_move, my_move)

        part2Score += round_scores[round_outcome]
}

puts "part 2 score:"
puts part2Score