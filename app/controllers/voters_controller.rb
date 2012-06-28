class VotersController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]

  def vote_now

    @voter = current_voter

    @voter.build_vote # this is to let the form assign a vote

    @candidates = Candidate.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voter }
    end
  end

  # GET /voters
  # GET /voters.json
  def index
    @voters = Voter.all
    
    @votes = Vote.all
    @candidates = Candidate.all
    
    #votecount = Vote.all.map {|vote| vote.candidate_id}
    #freq = votecount.inject(Hash.new(0)) { |h,v| h[v] += 1; h}
    #@winner = (votecount.sort_by { |v| freq[v]}.last).name

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @voters }
    end
  end

  # GET /voters/1
  # GET /voters/1.json
  def show
    @voter = Voter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voter }
    end
  end

  # GET /voters/new
  # GET /voters/new.json
  def new
    @voter = Voter.new
    
    @candidates = Candidate.all
    
    @voter.build_vote

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voter }
    end
  end

  # GET /voters/1/edit
  def edit
    @voter = Voter.find(params[:id])
    
    @candidates = Candidate.all
  end

  # POST /voters
  # POST /voters.json
  def create
    @voter = Voter.new(params[:voter])

    respond_to do |format|
      if @voter.save
        format.html { redirect_to @voter, notice: 'Voter was successfully created.' }
        format.json { render json: @voter, status: :created, location: @voter }
      else
        format.html { render action: "new" }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /voters/1
  # PUT /voters/1.json
  def update
    @voter = Voter.find(params[:id])

    respond_to do |format|
      if @voter.update_attributes(params[:voter])
        format.html { redirect_to @voter, notice: 'Voter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voters/1
  # DELETE /voters/1.json
  def destroy
    @voter = Voter.find(params[:id])
    @voter.destroy

    respond_to do |format|
      format.html { redirect_to voters_url }
      format.json { head :no_content }
    end
  end

  # ADMIN
  def admin
    @voters = Voter.all 
    @votes = Vote.all
    @candidates = Candidate.all

    respond_to do |format|
      format.html 
      format.json { render json: @voters }
    end
  end
  
end
