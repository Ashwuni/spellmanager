class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def edit
    @character = Character.find(params[:id])
  end

  def create
    
    @character = Character.new(character_params)

    if @character.save
      flash[:notice] = 'Character was successfully created.' 
      redirect_to @character
    else
      render :new
    end 
  end

  def update
    @character = Character.find(params[:id])      
    if @character.update(character_params)
      flash[:notice] = 'Character successfully updated.' 
      redirect_to @character 
    else
      render :edit
    end
  end

  def confirm_delete
      @character = Character.find(params[:id])
  end        
 
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
    def character_params
      params.require(:character).permit(:class, :class)
    end
end
