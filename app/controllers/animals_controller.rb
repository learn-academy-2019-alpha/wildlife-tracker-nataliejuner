class AnimalsController < ApplicationController
    
    def index
        @animals = Animal.all.order("id ASC")
    end
    
     def show
         @animal = Animal.find(params[:id])
     end 
    
    def new
        @animal = Animal.new
    end 
    
    def create
        @animal = Animal.new(animal_params)
        
        if @animal.save
            redirect_to animals_path
        else 
            render action: :new
        end
    end 
    
    def edit
        @animal = Animal.find(params[:id])
        
    end
    
    def destroy
        @animal = Animal.find(params[:id])
        @animal.destroy

    redirect_to animals_path

    end
    
    def update 
        @animal = Animal.find(params[:id])
        @animal.update(animal_params)
        
        redirect_to animals_path
    end
    
    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end 
 end

