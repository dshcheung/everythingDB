class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.save
      respond_to do |format|
        format.js { render 'create.js.erb' }
      end
    else
      respond_to do |format|
        format.js { render 'fail.js.erb' }
      end
    end
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end
end
