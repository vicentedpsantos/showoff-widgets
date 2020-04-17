# frozen_string_literal: true

RSpec.shared_context 'shared examples' do
  def create_valid_user
    user = {
      first_name: 'Valid',
      last_name: 'User',
      password: 'validpassword123!',
      image_url: 'https://validurl.com',
      email: 'validuser@gmail.com'
    }

    Showoff::RestClient.call(:create_user, opts: { user: user })

    user
  end

  def login_as(user)
    auth = Showoff::RestClient.call(
      :authenticate_user,
      opts: {
        email: user[:email],
        password: user[:password]
      }
    )['data']['token']

    {
      access_token: auth['access_token'],
      refresh_token: auth['refresh_token']
    }
  end
end
