class SpellsController < ApplicationController

  def index
    @spells = Spell.all 
  end

  def show
    @spell = Spell.find(params[:id])
  end

  def new
    @spell = Spell.new
  end

  def edit
    @spell = Spell.find(params[:id])
  end

  def create
    @spell = Spell.new(spell_params)

    if @spell.save
      flash[:notice] = 'Spell was successfully created!'  
      redirect_to @spell
    else
      render :new
    end
  end
    
  def update
    @spell = Spell.find(params[:id])  
    if @spell.update(spell_params)
      flash[:notice] = 'Spell was successfully updated!' 
      redirect_to @spell
    else
      render :edit
    end
  end

  def destroy
    @spell = Spell.find(params[:id])  
    if @spell.destroy
        flash[:notice] = 'Spell was successfully deleted!'
    else
        flash[:notice] = 'Unable to delete the spell! Sorry!'
    end
    redirect_to spells_url 
  end

  private
    def spell_params
      params.require(:spell).permit(:name, :level, :creater_id)
    end
      
end
