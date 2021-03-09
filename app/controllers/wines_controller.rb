class WinesController < ApplicationController

       def index
              @wines = Wine.all
              @wine = Wine.new
              @strains = Strain.all
       end

       def create
              @wine = Wine.new(wine_params) #Crea instancia del vino

              strain_ids = params[:wine][:strain_ids] #Recupera el array de aids de cepas
              strain_ids.delete("") unless strain_ids.nil? #Limpia el array

              strain_percents = params[:wine][:strain_percent] #recupera el array de porcentajes de cepas
              strain_percents.delete("") unless strain_percents.nil? #Limpia el array

              if @wine.save
                     strain_ids.length.times do |i| #Recorrro n veces el array de ids que tiene el mismo largo que el de porcentajes
                            WineStrain.create( #Creo una relacion entre los vinos y cepas
                                   wine_id: @wine.id, #Asigno el id del vino a la relacion
                                   strain_id: strain_ids[i], #asigno el id de la cepa a la relacion
                                   percent: strain_percents[i] #Asigno el porcentaje de la cepa a la relacion
                            )
                     end
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