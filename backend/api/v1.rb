module API
  class V1 < Roda
    plugin :rest_api
    plugin :json

    route do |r|
      r.api do
        r.version 1 do
          r.resource :categories do |categories|
            categories.list do
              DB.relation(:categories) { |s| s.all }.as(:categories)
            end
          end
        end
      end
    end
  end
end