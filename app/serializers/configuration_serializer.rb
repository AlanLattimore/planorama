class ConfigurationSerializer < ActiveModel::Serializer
  attributes :id, :lock_version, :parameter, :parameter_value,
             :created_at, :updated_at, :parameter_name
end