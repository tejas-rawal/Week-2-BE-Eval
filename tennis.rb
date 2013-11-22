module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Tennis::Player.new
      @player2 = Tennis::Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_point(winner)
      if winnner == @player1
        @player1.record_won_ball
        return @player1.points
      else
        @player2.record_won_ball
        return @player2.points
      end

      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
    end

    def score

    end
  end

  class Player
    attr_accessor :points, :opponent, :player_advantage, :result

    def initialize
      @points = 0
      @player_advantage = false
      @result = {}
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      
      case @points
        when 0 then result[@points] = 'love'
        when 1 then result[@points] = 'Fifteen'
        when 2 then result[@points] = 'Thirty'
        when 3 then result[@points] = 'Forty'
        else return @points
      end
      
      return @result
    end
  end
end