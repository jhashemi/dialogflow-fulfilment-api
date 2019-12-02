# frozen_string_literal: true

module Dialogflow
  module Fulfilments
    module Parsers
      module Helpers
        module OutputContexts
          module_function

          def format_parameters(output_contexts)
            output_contexts = Array(output_contexts)

            output_contexts.map do |output_context|
              parameters = output_context[:parameters] || {}

              formatted_params = parameters.each_with_object({}) do |(k, v), obj|
                key = k.to_s.underscore.to_sym
                obj[key] = v
              end

              output_context[:parameters] = formatted_params
              output_context
            end
          end

          def extract_parameters(output_contexts)
            output_contexts = Array(output_contexts)

            output_contexts.each_with_object({}) do |output_context, obj|
              parameters = output_context[:parameters] || {}

              obj.merge!(parameters)
            end
          end
        end
      end
    end
  end
end
