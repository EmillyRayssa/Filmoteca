User.find_or_create_by!(email_address: "admin@filmoteca.com") do |user|
    user.password = "123456"
    user.password_confirmation = "123456"
  end