class SpellsController < ApplicationController

  def index
    @spells = Spell.all 
  end

  def show
    @spells = Spell.find(params[:id])
  end

  def new
    @spells = Spell.new
  end

  def edit
    @spells = Spell.find(params[:id])
  end

  def create
    @spells = Spell.new(spell_params)

    if @spells.save
      flash[:notice] = 'Spell was successfully created!'  
      redirect_to @spells
    else
      render :new
    end
  end
    
  def add_to_book
    @spells = Spell.find(params[:id])
      
#        book = Book.find(spell_book_params)
       book = Book.find(@spells.add_to_book)

       book.spells << [@spells]
      flash[:notice] = 'Spell was successfully added!' 
      redirect_to @spells
  end
    
  def update
    @spells = Spell.find(params[:id])  
    if @spells.update(spell_params)
      flash[:notice] = 'Spell was successfully updated!' 
      redirect_to @spells
    else
      render :edit
    end
  end

  def destroy
    @spells = Spell.find(params[:id])  
    if @spells.destroy
        flash[:notice] = 'Spell was successfully deleted!'
    else
        flash[:notice] = 'Unable to delete the spell! Sorry!'
    end
    redirect_to spells_url 
  end

  private
    def spell_params
      params.require(:spell).permit(:name, :level, :school, :classes, :concentration, :description)
    end
    def spell_book_params
      params.require(:id)
    end
      
end
