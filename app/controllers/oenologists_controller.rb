class OenologistsController < ApplicationController

       def new
              @oenologist = Oenologist.new
       end

       def create
              @oenologist = Oenologist.new(oenologist_params)
              if @oenologist.save
                     redirect_to root_path, notice: "Enologo agregado éxitosamente"
              else
                     redirect_to root_path, notice: "Ocurrio un error agregando al enolgo"
              end
       end

       private
              def oenologist_params
                     params.require(:oenologist).permit(:name, :age, :nationality, :editor, :writer, :reviewer)
              end
end