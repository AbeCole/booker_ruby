module Booker
  module CustomerREST
    include CommonREST

    def create_class_appointment(booker_location_id:, class_instance_id:, customer:, options: {})
      post '/class_appointment/create', build_params({
            'LocationID' => booker_location_id,
            'ClassInstanceID' => class_instance_id,
            'Customer' => customer
          }, options), Booker::Models::Appointment
    end

    def run_multi_spa_multi_sub_category_availability(booker_location_ids:, treatment_sub_category_ids:, start_date_time:, end_date_time:, options: {})
      post '/availability/multispamultisubcategory', build_params({
            'LocationIDs' => booker_location_ids,
            'TreatmentSubCategoryIDs' => treatment_sub_category_ids,
            'StartDateTime' => start_date_time,
            'EndDateTime' => end_date_time,
            'MaxTimesPerTreatment' => 1000
          }, options), Booker::Models::SpaEmployeeAvailabilitySearchItem
    end

    def run_multi_service_availability(booker_location_id, treatment_ids, start_date_time, end_date_time, options: {})
      post '/availability/multiservice', build_params({
        'LocationID' => booker_location_id,
        'StartDateTime' => start_date_time,
        'EndDateTime' => end_date_time,
        'MaxTimesPerDay' => 100,
        'Itineraries' => treatment_ids.map { |id| {'Treatments' => [{'TreatmentID' => id}]} }
      }, options), Booker::Models::MultiServiceAvailabilityResult
    end

    def run_class_availability(booker_location_id:, from_start_date_time:, to_start_date_time:, options: {})
      post '/availability/class', build_params({
          'FromStartDateTime' => from_start_date_time,
          'LocationID' => booker_location_id,
          'OnlyIfAvailable' => true,
          'ToStartDateTime' => to_start_date_time,
          'ExcludeClosedDates' => true
        }, options), Booker::Models::ClassInstance
    end

    def get_locations
      post '/locations', build_params
    end

    def get_treatments(location_id, category_id = nil)
      post '/treatments', build_params({
        'LocationID' => location_id,
        'CategoryID' => category_id
      })
    end

    def get_categories(location_id)
      get '/treatment_categories', build_params({
        'location_id' => location_id
      })
    end

    def create_customer(data)
      post '/customer/account', build_params({
        'Email' => data[:email],
        'Password' => data[:password],
        'LocationID' => data[:location_id],
        'FirstName' => data[:first_name],
        'LastName' => data[:last_name],
        'HomePhone' => data[:cell_phone]
      })
    end

    def create_incomplete_appointment(booker_location_id, start_time, treatment_id, options: {})
      post '/appointment/createincomplete', build_params({
        'LocationID' => booker_location_id,
        'ItineraryTimeSlot' => {
          "CurrentPackagePrice": {
              "Amount": 0,
              "CurrencyCode": ""
          },
          "IsPackage": false,
          "PackageID": nil,
          'StartDateTime' => start_time,
          'TreatmentTimeSlots' => [{
            "CurrentPrice": {
              "Amount": 0,
              "CurrencyCode": ""
            },
            "Duration": nil,
            "EmployeeID": nil,
            "StartDateTime": start_time,
            "TreatmentID": treatment_id,
            "RoomID": nil,
            "Employee2ID": nil,
            "PrefferedStaffGender": nil,
            "EmployeeWasRequested": false
          }]
        }
      }, options)
    end

    def create_appointment(booker_location_id, start_time, treatment_id, incomplete_appoinment_id, customer_id, options: {})
      post '/appointment/create', build_params({
            'LocationID' => booker_location_id,
            'ItineraryTimeSlotList' => [
              "StartDateTime": start_time,
              'TreatmentTimeSlots' => [{
                "StartDateTime": start_time,
                "TreatmentID": treatment_id
              }]
            ],
            'IncompleteAppointmentID' => incomplete_appoinment_id,
            'Customer' => {
              'ID' => customer_id
            }
          }, options), Booker::Models::Appointment
    end
  end
end
