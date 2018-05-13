module Admin
  class RoutesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Route.
    #     page(params[:page]).
    #     per(10)
    # end
    
    def create
      resource = resource_class.new(route_resource_params)
      authorize_resource(resource)

      if resource.save
        redirect_to(
          [namespace, resource],
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource),
        }
      end
    end

    private
    
    def route_resource_params
      resource_params.merge(geojson_data: resource_params[:geojson_data].read)
    end
  end
end
