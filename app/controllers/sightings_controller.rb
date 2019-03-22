class SightingsController < ApplicationController
    def index 
         @sightings= Sighting.all
     end

    def new 
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.new
    end 
    
    def create
        @sighting = Sighting.new(sighting_params)
        if @sighting.save
            redirect_to animal_path(@sighting.animal)
        else
            redirect_to new_animal_path
        end 
end
    
    # def create
    #     @animal = Animal.sightings.find(params[:animal_id])
        
    #     @sightings = @animal.sightings.create(sighting_params)
    #         redirect_to sightings_path
    # end
    
    #  def update 
    #     @sighting = Sighting.find(params[:id])
    #     @sighting.update(sighting_params)
        
    #     redirect_to animals_path()
    # end
    
    def edit 
        @animal = Animal.find params[:id]
    end
    
     private
    def sighting_params
        params.require(:sighting).permit(:animal_id, :seen_at, :latitude, :longitude)
    end 
end
