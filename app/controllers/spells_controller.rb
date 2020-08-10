class SpellsController < ApplicationController

  # GET /spells
  def index
    # We've added a method, self.order_by, to the Book model, 
    # see models/book.rb
    @spells = Spell.order_by params[:order_by]
  end

  # GET /books/:id
  def show
    @spell = Spell.find(params[:id])
  end

  # GET /books/new
  def new
    @spell = Spell.new
  end

  # GET /books/:id/edit
  def edit
    @spell = Spell.find(params[:id])
  end

  # POST /books
  def create
    # active record new, create, and update allow us to pass in a hash with the
    # attributes and their values, book_params is a method (see below!)
    @spell = Spell.new(spell_params)

    if @spell.save
      flash[:notice] = 'Spell was successfully created!'  
      redirect_to @spell
    else
      render :new
    end
  end

  # PATCH/PUT /books/:id
  def update
    @spell = Spell.find(params[:id])  
    if @spell.update(spell_params)
      flash[:notice] = 'Spell was successfully updated!' 
      redirect_to @spell
    else
      render :edit
    end
  end

  # DELETE /books/:id
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
    # Only allow a trusted parameter "white list" through.
    def spell_params
      # params is a hashtable.  It should have in it a key of :book.
      # The value for the :book key is another hash.
      # If params does not contain the key :book, an exception is raised.  
      # Only the "book" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of :title, :year, :author_id
      params.require(:spell).permit(:name, :level, :creater_id)
    end
      
end
