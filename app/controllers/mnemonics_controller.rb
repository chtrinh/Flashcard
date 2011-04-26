class MnemonicsController < ApplicationController
  before_filter :authenticate
  
  def index
    @word = Word.find(params[:word_id])
    @mnemonics = @word.mnemonics

    respond_to do |format|
      format.html  { 
        render :partial => 'index',:collection => @mnemonics, :as => :mnemonic
      }
    end
  end

  def show
    @word = Word.find(params[:word_id])

    respond_to do |format|
      format.js  { 
        render :json =>  {:mnemonic => current_user.getMnemonic(@word), :word => @word.id}
      }
    end
  end

  # GET /tests/new
  # GET /tests/new.xml
  def new
    @mnemonic = Mnemonic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mnemonic }
    end
  end

  # GET /tests/1/edit
  def edit
    @mnemonic = Mnemonic.find(params[:id])
  end

  # POST /tests
  # POST /tests.xml
  def create
    @mnemonic = current_user.mnemonics.build(params[:mnemonic])
    @mnemonic.word = Word.find(params[:word_id])
    current_user.mnemonics << @mnemonic
    
    respond_to do |format|
      if @mnemonic.save && current_user.save
        format.js 
      else
        flash[:notice] = "Thanks for commenting!"
      end
    end
  end

  # PUT /tests/1
  # PUT /tests/1.xml
  def update
    @mnemonic = Mnemonic.find(params[:id])

    respond_to do |format|
      if params[:mnemonic]
        @mnemonic.update_attributes(params[:mnemonic]) if @mnemonic.owner_id == current_user.id
        logger.info "UPDATED"
        format.js { render :nothing => true}
      else
        logger.info "SELECTED"
        user_word_mnemonic = current_user.mnemonics.find_by_word_id(params[:word_id])
        current_user.mnemonics.delete(user_word_mnemonic)
        current_user.mnemonics << @mnemonic
        current_user.save
        format.js { render :nothing => true}
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.xml
  def destroy
    @mnemonic = Mnemonic.find(params[:id])
    @mnemonic.destroy

    respond_to do |format|
      format.html { redirect_to(tests_url) }
      format.xml  { head :ok }
    end
  end
end
