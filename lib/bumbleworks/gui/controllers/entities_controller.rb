module Bumbleworks
  module Gui
    class EntitiesController < ApplicationController
      def types
        expose :entity_classes => Bumbleworks.entity_classes, :title => 'Entity Types'
      end

      def index
        expose :entity_class => entity_class, :entities => entity_class.all,
          :title => "Entity Types : #{entity_class}"
      end

      def show
        expose :entity => entity_class.first_by_identifier(params[:id]),
          :title => "Entity : #{entity_class}"
      end

    private

      def entity_class
        class_name = Bumbleworks::Support.camelize(params[:type])
        entity_class = Bumbleworks::Support.constantize(class_name)
      end
    end
  end
end