class DogsController < ApplicationController

    def index
        render json: Dog.all, include: :nicknames
    end

    def show
        render json: Dog.find(params[:id]), include: :nicknames
    end

    def create
        dog = Dog.create(dog_params)
        render json: dog, include: :nicknames
    end

    def update
        dog = Dog.find(params[:id])
        dog.update(dog_params)
        render json: dog, include: :nicknames
    end

    def destroy
        dog = Dog.find(params[:id])
        dog.destroy_all
        render json: { success: 'woohoooo'}
    end

    private

    def dog_params
        params.permit(:mood, :img)
    end
end
