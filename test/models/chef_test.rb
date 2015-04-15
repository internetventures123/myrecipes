require "test_helper"

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "Samd" , email: "sadm@sam.com")
    @recipe = @chef.recipes.build(name: "batcxaba", summary: "potato nu saak che ne roti ne bhat" , description: "it is a potato saak that comes with roti and saak")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef id should be present " do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "chef should be valid" do
      assert @chef.valid?
  end

  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chefname should be too long" do
    @chef.chefname = "a" * 41
assert_not @chef.valid?
  end
  
  test "chefname should be too short" do
    @chef.chefname = "aa"
assert_not @chef.valid?
  end
  
    test "email should be present" do
    @chef.email = " "
assert_not @chef.valid?
  end
  
    test "email should be not too long" do
    @chef.email = "a" * 101 + "@s.com"
     assert_not @chef.valid?
  end
  
  test "email should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid emails" do
     v_email = %w[user@aaa.com user2@aaa.com user3@aaa.com user4@aaa.com]
     v_email.each do |v|
      @chef.email  = v
      assert @chef.valid?, "#{v.inspect} is valid"
     end
  end
  
    test "email validation should reject invalid emails" do
      iv_email = %w[sssatssscom sseatder.com ]
      iv_email.each do |v|
      @chef.email  = v
      assert_not @chef.valid?, "#{v.inspect} is invalid"
  end
  end


  
end