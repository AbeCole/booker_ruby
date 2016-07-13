module Booker
  module Models
    class Employee < Model
      attr_accessor 'ID',
                    'FirstName',
                    'LastName',
                    'Gender',
                    'Photo',
                    'ProfileDescription'
    end
  end
end
