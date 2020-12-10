require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products # Load the products.yml fixture

  test "Price attribute should be greater than or equal to 0.01" do
    product = Product.new(
      title: "Nike Shoes",
      description: "Made by Nike",
      image_url: "nike.png")

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 1
    assert product.valid?

  end


  def new_product(image_url)
    Product.new(
      title: "Nike Shoes",
      description: "Made by Nike",
      price: 1,
      image_url: image_url)
  end

  test "image_url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
          http://a.b.c/x/y/z/fred.gif }

    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |image_url|
      assert new_product(image_url).valid?,
      "#{image_url} shouldn't be invalid"
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?,
      "#{image_url} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(
      title: products(:adidas).title, # Use title from adidas row in products.yml
      description: "Product description",
      price: 1,
      image_url: "fred.gif")

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                  product.errors[:title]
  end

end
