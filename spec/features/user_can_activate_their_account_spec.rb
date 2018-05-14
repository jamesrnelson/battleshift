require 'rails_helper'

describe 'User' do
  context 'Receives registration email' do
    scenario 'and can click the link' do
      user = User.create(name: 'Jimmy', email: 'nelson.jimmy@gmail.com', password: 'password', password_confirmation: 'password')

      email = UserMailer.with(user: user).registration_email.deliver_now

      expect(email.from).to eq(['no-reply@battleshift.com'])
      expect(email.to).to eq([user.email])
      expect(email.subject).to eq('Welcome to Battleshift!')
      expect(email.body).to have_content('Visit here to activate your account.')
    end
  end
end