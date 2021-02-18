require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    # Assertions based on products.yml fixture
    assert_select 'nav.side_nav a', minimum: 4
    assert_select 'main ul.catalog li', 3
    assert_select 'h2', 'Clipper de Fresa'
    # RegExp adapted to format 50.850,87€
    assert_select '.price', /(\d+\.?),\d\d\€/
  end

end
