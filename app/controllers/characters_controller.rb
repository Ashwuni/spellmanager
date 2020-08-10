class CharactersController < ApplicationController

  # GET /authors
  def index
    @characters = Character.all
  end

  # GET /authors/:id
  def show
    @character = Character.find(params[:id])
  end

  # GET /authors/new
  def new
    @character = Character.new
  end

  # GET /authors/:id/edit
  def edit
    @character = Character.find(params[:id])
  end

  # POST /authors
  def create
    # active record new, create, and update allow us to pass in a hash with the
    # attributes and their values, author_params is a method (see below!)      
    @character = Character.new(character_params)

    if @character.save
      flash[:notice] = 'Character was successfully created.' 
      redirect_to @character
    else
      render :new
    end 
  end

  # PATCH/PUT /authors/:id
  def update
    @character = Character.find(params[:id])      
    if @character.update(character_params)
      flash[:notice] = 'Character successfully updated.' 
      redirect_to @character 
    else
      render :edit
    end
  end

  # GET /authors/:id/confirm_delete  
  def confirm_delete
      @character = Character.find(params[:id])
      # show the form for confirm_delete of user 
  end        
    
  # DELETE /authors/:id
  def destroy
    @character = Character.find(params[:id])  
    if @character.num_books>0
        
         temp = @character.book_id
            array = Array.new
            temp.each do |x|

                 @book = Book.find(x)
                
                 list = ''
                 list = list+''+ @book.title

             if @book.destroy
                 flash[:notice] = 'Character was successfully deleted.'

             else
                flash[:notice] = 'Unable to delete character!'
             end
         end
        
        if @author.destroy
        
             flash[:notice] = 'Character was successfully deleted.'
        
        else
             flash[:notice] = 'Unable to delete character.'
        end
    else
        flash[:notice] = 'Book was successfully deleted.'
    
    end
    redirect_to characters_url 
  end

  private
    # Only allow a trusted parameter "white list" through.
    def character_params
      # params is a hashtable.  It should have in it a key of :author.
      # The value for the :author key is another hash.
      # If params does not contain the key :author, an exception is raised.  
      # Only the "author" hash is returned and only with the permitted key(s).
      params.require(:character).permit(:class, :class)
    end
end
