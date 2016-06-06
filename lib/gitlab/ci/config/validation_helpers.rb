module Gitlab
  module Ci
    class Config
      module ValidationHelpers
        private

        def validate_array_of_strings(values)
          values.is_a?(Array) && values.all? { |value| validate_string(value) }
        end

        def validate_variables(variables)
          variables.is_a?(Hash) &&
            variables.all? { |key, value| validate_string(key) && validate_string(value) }
        end

        def validate_string(value)
          value.is_a?(String) || value.is_a?(Symbol)
        end

        def validate_boolean(value)
          value.in?([true, false])
        end
      end
    end
  end
end
