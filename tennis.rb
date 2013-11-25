module Tennis
  class Game
    
    attr_accessor :player1, :player2

    def initialize
     
      @player1 = Tennis::Player.new
      @player2 = Tennis::Player.new
      @score_counter = 0

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
        @score_counter += 1
        return @player1.points
      else
        @player2.record_won_ball!
        @score_counter += 1
        return @player2.points
      end
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
    end

    # Returns result of the game at hand.
    # 
    # Acconts for advantage rule if game reaches duece.
    def result_game1
      
      minus_result = @player1.points - @player2.points

      # While less than 4 points have been recorded
      while @score_counter < 4
        if minus_result > 0
          return "Player 1 leads: #{@player1.score} - #{@player2.score}."
        elsif minus_result < 0
          return "Player 2 leads: #{@player2.score} - #{@player1.score}."
        else 
          return "The game is tied: #{@player1.score} - #{@player2.score}."
        end
      end

      # While either 4 or 5 points have been recorded
      while (@score_counter >= 4 && @score_counter < 6)
        if (@player1.points >= 4 || @player2.points >= 4)
          if minus_result > 0
            return "Congratulations Player 1. YOU WIN!"
            @player1.points = 0
          elsif minus_result < 0
            return "Congratulations Player 2. YOU WIN!"
            @player2.points = 0
          end
        else
          if minus_result > 0
            return "Player 1 leads: #{@player1.score} - #{@player2.score}."
          elsif minus_result < 0
            return "Player 2 leads: #{@player2.score} - #{@player1.score}."
          else 
            return "The game is tied: #{@player1.score} - #{@player2.score}."
          end
        end
      end

      # Once 6 points have been recorded
      while @score_counter >= 6
        case minus_result
        when 0
          return "The game is tied. Duece! Next point takes advantage."
        when 1
          @player1.player_advantage = true
          return "Advantage: Player 1"
        when -1
          @player2.player_advantage = true
          return "Advantage: Player 2"
        when 2
          return "Congratulations Player 1. YOU WIN!"
          @score_counter = 0
          @player1.points = 0
        else
          return "Congratulations Player 2. YOU WIN!"
          @score_counter = 0
          @player2.points = 0
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