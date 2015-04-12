class RemindersController < ApplicationController
  before_filter :authorize

  def index
    @reminders = Reminder.all
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(params.require(:reminder).permit(:message, :send_time))
    if @reminder.save
      flash[:notice] = "Reminder was saved."
      redirect_to @reminder
    else
      flash[:error] = "Uh oh, something went wrong; your reminder wasn't saved."
      render :new
    end
  end

  def edit
    @reminder = Reminder.find(params[:id])
  end

  def update
    @reminder = Reminder.find(params[:id])
    if @reminder.update_attributes(params.require(:reminder).permit(:message, :send_time))
      flash[:notice] = "Your reminder was updated."
      redirect_to @reminder
    else
      flash[:error] = "Uh oh, something went wrong; your reminder was not updated."
      render :edit
    end
  end

  def destroy
    @reminder = Reminder.find(params[:id])

    if @reminder.destroy
      flash[:notice] = "Your reminder was deleted successfully."
      redirect_to reminders_path
    else
      flash[:error] = "Uh oh, something went wrong; your reminder was not deleted."
      render :show
    end
  end
end
