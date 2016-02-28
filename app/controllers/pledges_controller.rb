class PledgesController < ApplicationController
  before_action :load_project

  def index
    @pledges = Pledge.all
  end

  def show
    @pledge = Pledge.find(params[:id])
    
    respond_to do |format|
      format.html
      format.js
    end

  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = @project.pledges.build(pledge_params)
    @pledge.backer = current_user
    @pledge.get_reward?(@project)


    if @pledge.save
      if @project.fully_funded?
        @project.backers.each do |backer|
          UserMailer.notify_fully_funded(backer, @project).deliver_later
        end
      end

      redirect_to project_pledge_path(@project, @pledge), notice: "Pledge successfully submitted!"
    else
      render :new, notice: "Pledge not successfully submitted!"
    end
  end

  def edit
    @pledge = Pledge.find(params[:id])
  end

  def update
    # Retrieves old pledge amount and adds new pledge amount to it.
    @pledge = Pledge.find(params[:id])
    @existing = @pledge.amount
    @pledge.update_attributes(pledge_params) #Updates @pledge with new amount value
    @pledge.amount += @existing

    if @pledge.save

      @pledge.get_reward?(@project)

      if @project.fully_funded?
        @project.backers.each do |backer|
          UserMailer.notify_fully_funded(backer, @project).deliver_later
        end
      end



      respond_to do |format|
        format.html
        format.js
      end

      flash[:notice] = "Pledge successfully updated."
      # redirect_to project_path(@project)
    else
      # render :edit
    end

  end










  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy
    flash[:notice] = "Pledge successfully deleted."
    redirect_to project_pledges_path
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

end
