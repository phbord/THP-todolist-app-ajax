require 'faker'

class EmailController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @flash = "Email received"
    mail = Faker::Internet.email
    object = Faker::Lorem.sentence(word_count: 3)
    body = Faker::Lorem.sentence(word_count: 15)
    read = Faker::Boolean.boolean
    @email_new = Email.new(
      email: mail,
      object: object,
      body: body,
      read: read
    )
    @email_new.save

    respond_to do |format|
      format.html {
        redirect_to root_path
        flash[:notice] = @flash
      }
      format.js {}
    end
  end

  def show
    @email = email_find

    respond_to do |format|
      format.html {
        redirect_to email_path
      }
      format.js {}
    end
  end

  def update
    @email = email_find
    @email.read = params[:read]
    @email.update(email_params)

    respond_to do |format|
      format.html {
        redirect_to root_path
        flash[:notice] = @flash
      }
      format.js { }
    end
  end

  def destroy
    @flash = "Email deleted"
    @email = email_find
    puts "*"*40
    p @email
    p @email.id
    puts "*"*40
    @email.destroy

    respond_to do |format|
      format.html {
        redirect_to root_path
        flash[:notice] = @flash
      }
      format.js { }
    end
  end

  private

  def email_find
    Email.find(params[:id])
  end

  def email_params
    params.permit(:id, :email, :body, :object, :read)
  end
end
