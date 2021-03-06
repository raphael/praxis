module Praxis
  module Types

    # Traits that are shared by MediaType and SimpleMediaType.
    module MediaTypeCommon
      extend ::ActiveSupport::Concern

      module ClassMethods
        def describe(shallow = false, **opts)
          hash = super
          unless shallow
            hash.merge!(identifier: @identifier.to_s, description: @description)
          end
          hash
        end

        def description(text=nil)
          @description = text if text
          @description
        end

        # Get or set the identifier of this media type.
        #
        # @deprecated this method is not deprecated, but its return type will change to MediaTypeIdentifier in Praxis 1.0
        #
        # @return [String] the string-representation of this type's identifier
        def identifier(identifier=nil)
          return @identifier.to_s unless identifier
          (@identifier = MediaTypeIdentifier.load(identifier)).to_s
        end
      end

    end

  end
end
