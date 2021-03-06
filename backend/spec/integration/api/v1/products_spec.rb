RSpec.describe 'api/v1/categories/:id/products', type: :integration do
  describe 'GET list' do
    let(:product_attributes_names) {
      [:category_id, :id, :name, :description, :active, :price]
    }
    before { do_get }

    it_behaves_like 'a valid json response'

    it 'returns valid response format' do
      response = json(last_response)

      expect(response).to have_key(:products)
      expect(response[:products]).to_not be_empty
      expect(response[:products].first.keys).to eq(product_attributes_names)
    end

    def do_get
      get 'api/v1/categories/1/products'
    end
  end
end
