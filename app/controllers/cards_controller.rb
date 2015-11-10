class CardsController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @card = Card.new
  end

  def create

    cardnum = params[:card][:cardnum]
    cardsecuritynum = params[:card][:cardsecuritynum]
    cardexp = params[:card][:cardexp]
    cardcompany = params[:card][:cardcompany]
    user_id = session[:user_id]

    # Add Card Company Automatically Based on Credit Card Pattern
    # This can be linked to jQuery for dynamic interaction as user enters card
    if cardnum =~ /\A^4[0-9]{12}(?:[0-9]{3})?$\z/
      cardcompany = "Visa"
    elsif cardnum =~ /\A^6(?:011|5[0-9]{2})[0-9]{12}$\z/
      cardcompany = "Discover"
    elsif cardnum =~ /\A^3[47][0-9]{13}$\z/
      cardcompany = "American Express"
    elsif cardnum =~ /\A^5[1-5][0-9]{14}$\z/
      cardcompany = "Mastercard"
    else
      cardCompany = "Unknown"
    end


    @card = Card.create(cardnum: cardnum, cardsecuritynum: cardsecuritynum, cardexp: cardexp, cardcompany: cardcompany, user_id: user_id)
    if @card.save
      flash[:notice] = "Card Successfully Added by User # #{user_id}"
    else
      flash[:notice] = "Error Adding New Card, Please Try Again"
    end
    redirect_to root_path
  end

  def show
    @sharedCard = Sharedcard.new
  	@thisId = session[:user_id]

    # Grant Admin Special Access to View All Cards
    if session[:user_id] == 10
      @userOwnedCards = Card.all

      # Build Array to include the id's of all cards each user owns
      userCardIdArray = []

      if @userOwnedCards.length > 0
        @userOwnedCards.each do |card|
          userCardIdArray.push(card.id)
        end
      end
    else
      #find all cards the user uploaded - loop thru all Cards where user_id is equal to session_id
      @userOwnedCards = Card.where(user_id:@thisId)

      # Build Array to include the id's of all cards each user owns
      userCardIdArray = []
      
      if @userOwnedCards.length > 0
        @userOwnedCards.each do |card|
          userCardIdArray.push(card.id)
        end
      end
    end
    # loop thru Sharedcards and see where user_id is equal to session_id - this will return a hash that contains card_id, push the card_id
    # into an array, take each card_id from that array and use that to loop thru Card model and return all card data - wrap in an IF not 
    # empty then run the loop to display data  
    sharedcardLoop = Sharedcard.where(user_id:@thisId)
    @userCardArray = []

    if sharedcardLoop.length > 0
      sharedcardLoop.each do |card|
        cardId = card.card_id 
        if !userCardIdArray.include?(cardId)
          @userCardArray.push(cardId)
        end
      end
    end    
  end

  def destroy
    @card = Card.find(params[:id])
    @sharedCard = Sharedcard.where(card_id:params[:id])
    if @sharedCard.length > 0
      @sharedCard.delete_all
    end
    @card.delete

    # @deleteCard.destroy_all
    # @deleteSharedCard.delete_all
    redirect_to card_path(session[:user_id])
    # redirect_to root_path
    flash[:notice] = 'Card Removed!'
  end

end







