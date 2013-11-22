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
      if winner == @player1
        @player1.record_won_ball!
        return @player1.points
      else
        @player2.record_won_ball!
        return @player2.points
      end

      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
    end

    def result_game1
      score_counter = 0

      while score_counter < 3
        if score_counter == 0
          
        end
      end
    end
  end

  class Player
    attr_accessor :points, :opponent, :player_advantage, :player_score

    def initialize
      @points = 0
      @player_advantage = false
      @player_score = {}
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
      return @points
    end

    # Returns the String score for the player.
    def score
      
      case @points
        when 0 
          @player_score[@points] = 'Love'
          return @player_score[@points]
        when 1 
          @player_score[@points] = 'Fifteen'
          return @player_score[@points]
        when 2 
          @player_score[@points] = 'Thirty'
          return @player_score[@points]
        when 3 
          @player_score[@points] = 'Forty'
          return @player_score[@points]
        else 
          return @points 
      end
    end
  end
end