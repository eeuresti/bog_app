class CreaturesController < ApplicationController
	def index
  	@creatures = Creature.all
	end

	def new
    @creature = Creature.new
		render :new
  end

  def create
    new_creature = params.require(:creature).permit(:name, :description)
    Creature.create(new_creature)
    redirect_to "/creatures/#{creature.id}"
  end

  def show
    id = params[:id]
    @creature = Creature.find(id)
    render :show
  end

  def edit
    id = params[:id]
    @creature = Creature.find(id)
    render :edit
  end

  def udpate
    creature_id = params[:id]
    creatuere = Creature.find(Creature_id)

    updated_attributes = params.require(:creature).permit(:name, :description)

		creature.update_attributes(updated_attributes)
		redirect_to "/creatures/#{creature_id}"
  end

    def destroy
    	id = params[:id]
    	creature = Creature.find(id)
    	creature.destroy
    	redirect_to "/creatures"
    end

end
