class WinesController < ApplicationController

       def index
              @wines = Wine.all
              @wine = Wine.new
              @strains = Strain.all
       end

       def create
              @wine = Wine.new(wine_params)

              strain_ids = params[:wine][:strain_ids]
              strain_ids.delete("")

              strains = Strain.find(strain_ids)

              strains.each {|st| @wine.strains << st }

              if @wine.save
                     redirect_to root_path, notice: "Vino creado éxitosamente"
              else
                     redirect_to root_path, alert: "Ocurrió un error creando el vino"
              end
       end

       private
       def wine_params
              params.require(:wine).permit(:name)
       end

end