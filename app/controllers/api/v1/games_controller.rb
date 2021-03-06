module Api
  module V1
    class GamesController < ActionController::API
      def show
        if Game.exists?(id: params[:id])
          game = Game.find(params[:id])
          render json: game
        else
          render status: 400 and return
        end
      end

      def create
        challenger = User.find_by(api_key: request.headers["X-API-Key"])
        opponent = User.find_by(email: params["opponent_email"])
        challenger_board = BoardGenerator.new(4).generate
        opponent_board = BoardGenerator.new(4).generate

        game = Game.create(
          player_1_id: challenger.id,
          player_1_board_id: challenger_board.id,
          player_2_id: opponent.id,
          player_2_board_id: opponent_board.id
        )

        render json: game
      end
    end
  end
end
