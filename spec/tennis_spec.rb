require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'pry-plus'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do

      expect(game.player1.opponent).to eq game.player2
      expect(game.player2.opponent).to eq game.player1
    end
  end

  describe '#wins_point' do
    it 'increments the points of the winning player' do
      game.wins_point(game.player1)

      expect(game.player1.points).to eq(1)
    end
  end

  describe '#result_game1' do
    context 'After two points have been awarded' do
      it 'returns the score stating that player 1 leads Thirty - Love' do
        

        game.wins_point(game.player1)
        game.wins_point(game.player1)

        expect(game.result_game1).to eq "Player 1 leads: Thirty - Love."
      end
    
      it 'returns that the game is tied including what score it is' do

        game.wins_point(game.player1)
        game.wins_point(game.player2)

        expect(game.result_game1).to eq "The game is tied: Fifteen - Fifteen."
      end
    end

    context 'After 3 points have been awarded' do
      it 'returns the score stating that player 2 leads Thirty - Fifteen' do

        game.wins_point(game.player2)
        game.wins_point(game.player1)
        game.wins_point(game.player2)

        expect(game.result_game1).to eq "Player 2 leads: Thirty - Fifteen."
      end
    end

    context 'After 4 points have been awarded' do
      it 'returns the score stating that player 1 lead Forty - Fifteen' do

        game.wins_point(game.player2)
        game.wins_point(game.player1)
        game.wins_point(game.player1)
        game.wins_point(game.player1)

        expect(game.result_game1).to eq "Player 1 leads: Forty - Fifteen."
      end

      it 'returns that Player 2 has won the game' do
        
        game.wins_point(game.player2)
        game.wins_point(game.player2)
        game.wins_point(game.player2)
        game.wins_point(game.player2)

        expect(game.result_game1).to eq "Congratulations Player 2! You have won the game."
      end
    end

    context 'After 5 points have been awarded' do
      it 'returns that Player 1 leads the game Forty - Thirty' do

        game.wins_point(game.player1)
        game.wins_point(game.player2)
        game.wins_point(game.player1)
        game.wins_point(game.player2)
        game.wins_point(game.player1)

        expect(game.result_game1).to eq "Player 1 leads: Forty - Thirty."
      end
    end

    context 'After 6 point have been awarded and a tie occurs' do
      it 'returns that the game has entered duece' do

        game.wins_point(game.player1)
        game.wins_point(game.player2)
        game.wins_point(game.player1)
        game.wins_point(game.player2)
        game.wins_point(game.player1)
        game.wins_point(game.player2)

        expect(game.result_game1).to eq "Duece! Next point takes advantage."
      end
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
    it 'sets player_advantage to false' do
      expect(player.player_advantage).to eq (false)
    end
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('Love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('Fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do
        player.points = 2

        expect(player.score).to eq('Thirty')
      end 
    end
    
    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3

        expect(player.score).to eq('Forty')
      end
    end
  end  
end