module Admin
  class RoutesController < Admin::ApplicationController
    
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
    
    def update
      resource = resource_class.find(params[:id])
      authorize_resource(resource)

      if resource.update(route_resource_params)
        redirect_to(
          [namespace, resource],
          notice: translate_with_resource("update.success"),
        )
      else
        render :edit, locals: {
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
