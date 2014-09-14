require 'test_helper'



describe User do
  it "must set default params during creation" do
    params = {name: "Sam Rast", email: "sam-rast@gmail.com", password: "SECUREPASS"}
    user = User.create params
    user.username.must_equal "sam-rast"
    user.initials.must_equal "SR"
  end

  it "must give a new username if username exisits" do
    first_user = create(:user)
    second_user = create(:user, email: "#{first_user.username}@somewhere.com")
    second_user.username.must_equal "#{first_user.username}1"
  end
end

