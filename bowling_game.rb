class BowlingGame

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    total_score = 0
    current_roll = 0
    next_bowl_rule(total_score,current_roll)
  end

  private

  def next_bowl_rule(this_step, score)
    while this_step < @rolls.size - 1
      roll      = @rolls[this_step]
      next_roll = @rolls[this_step + 1]
      two_rolls = roll + next_roll
      next_next_roll = @rolls[this_step + 2]

      if roll == 10
        score += strike(next_roll, next_next_roll)
        this_step +=1
      elsif two_rolls == 10
        score += spare(next_next_roll)
        this_step += 2
      else
        score += normal_bowl(two_rolls)
        this_step += 2
      end

    end
    score
  end

  def strike(roll1, roll2)
    10 + roll1 + roll2
  end

  def spare(roll2)
    10 + roll2
  end

  def normal_bowl(rolls)
    rolls
  end


end