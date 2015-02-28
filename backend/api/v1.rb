module API
  class V1 < Roda
    plugin :rest_api
    plugin :json

    route do |r|
      r.api do
        r.version 1 do
          r.resource :categories do |categories|
            categories.list do
              #TODO find better way for json serialization
              { categories: DB.relation(:categories).all.to_a }
            end
          end
        end
      end
    end
  end
end
