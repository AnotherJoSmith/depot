require 'test_helper'

class ProductTest < ActiveSupport::TestCase

    fixtures :products

    test "product attributes must not be empty" do
        product = Product.new
        assert product.invalid?
        assert product.errors[:title].any?
        assert product.errors[:description].any?
        assert product.errors[:price].any?
        assert product.errors[:image_url].any?
    end

    test "product price must be positive" do
        product = Product.new(title: "every day",
            description: "David Levithan",
            image_url: "every_day.jpg")
        product.price = -1
        assert product.invalid?
        assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

        product.price = 0
        assert product.invalid?
        assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

        product.price = 1
        assert product.valid?
    end

    def new_product(image_url)
        Product.new(title: "every day",
            description: "David Levithan",
            price: 1,
            image_url: image_url)
    end

    test "image url" do
        ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.d/as/d/g/e/fred.gif }
        bad = %w{ fred.doc fred.gif/more fred.gif.more }
        ok.each do |name|
            assert new_product(name).valid?, "#{name} should be valid"
        end
        bad.each do |name|
            assert new_product(name).invalid?, "#{name} should not be valid"
        end
    end

    test "product is not valid without a unique title" do 
        product = Product.new(title: products(:ruby).title,
                              description: "yyy",
                              price: 1,
                              image_url: "fred.gif")

        assert product.invalid?
        assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
    end

    test "product title needs to be less then 128 characters" do
        product = Product.new(title: "Very long title with over 128 character, 
                                      in fact i don't even want to count them because 
                                      it would be a waste of my time. Ok this should be enough",
                              description: "Long title",
                              price: 99.99,
                              image_url: "sup.png")
        assert product.invalid?
        assert_equal ["Your title must be 01111111 characters or less"], product.errors[:title]
    end
end
