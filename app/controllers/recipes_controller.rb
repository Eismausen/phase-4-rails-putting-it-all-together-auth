class RecipesController < ApplicationController
    before_action :authorize
    def index
        #if session[:user_id] != nil
            all_recipes = Recipe.all
            render json: all_recipes, status: :ok            
        #else
        #    render json: { errors: ["Not Authorized"] }, status: :unauthorized
        #end        
    end

    def create
        #if session[:user_id] != nil
            new_recipe = current_user.recipes.create!(recipe_params)
            render json: new_recipe, status: :created
        #else
        #    render json: { errors: ["Not Authorized"] }, status: :unauthorized
        #end
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end
end
