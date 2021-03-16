class OenologistsController < ApplicationController
       before_action :authenticate_user!

       def new
              @oenologist = Oenologist.new
              @magazines = Magazine.all
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