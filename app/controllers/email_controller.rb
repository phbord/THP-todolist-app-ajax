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
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html {
        redirect_to email_path
      }
      format.js {}
    end
  end
end
