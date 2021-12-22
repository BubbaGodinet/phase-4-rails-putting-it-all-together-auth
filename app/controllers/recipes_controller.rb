class RecipesController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # before_action :authorize

    def index 
        render json: Recipe.all
    end

    def create
        recipe = @current_user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end
#   def authorize
#     return render json: {error: 'Not authorized'}, status: :unauthorized unless session.include? :user_id
#   end 

#   def record_not_found
#     render json: { error: "Article not found" }, status: :not_found
#   end
end
