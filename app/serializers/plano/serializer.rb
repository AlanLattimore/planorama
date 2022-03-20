module Plano
  module Serializer
    extend ActiveSupport::Concern

    class_methods do
      def protected_attribute(*attributes_list, &block)
        proc = Proc.new { |record, params|
          # logic to test if the person has access
          AccessControlService.allowed_attribute_access?(
            instance: record,
            attributes: attributes_list,
            person: params[:current_person]
          )
        }
        # if proc is at the end remove it and add the new one
        # new_list = attributes_list #+ [{if: proc}]

        # TODO: check how many args we could have
        attributes(*attributes_list) do |record, params|
          if AccessControlService.allowed_attribute_access?(
              instance: record,
              attributes: attributes_list,
              person: params[:current_person]
            )
            if (block)
              block.call(record, params)
            else
              "HELP"
              record.send attributes_list.first
            end
          else
            'n/a'
          end
        end
      end

      def protected_attributes(*attributes_list, &block)
        attributes_list.each do |attr|
          protected_attribute(attr, &block)
        end
      end
    end
  end
end
