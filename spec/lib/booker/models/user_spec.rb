require 'spec_helper'

describe Booker::Models::User do
  it 'has the correct attributes' do
    ['AllowCreateAppointment',
      'AllowCreateAppointmentsInPast',
      'AllowEditAppointment',
      'AllowEditBusyTimeBlock',
      'AllowEditClass',
      'AllowViewAllSchedules',
      'AllowViewAppointments',
      'AllowViewCreditCardNumber',
      'AllowViewCustomerInfo',
      'AllowViewDashBoard',
      'AllowViewOrders',
      'Email',
      'EmployeeID',
      'FirstName',
      'ID',
      'IsAccountManager',
      'IsAdministrator',
      'IsAdministratorAdmin',
      'IsAnyAdmin',
      'IsBrandReservationist',
      'IsImplementator',
      'IsReservationist',
      'IsReservationistOrTechnician',
      'IsSuperAdministrator',
      'IsTechnician',
      'IsTranslator',
      'LastName',
      'RoleNames',
      'Username',
      'DateCreated',
      'AllowOverrideOrderItemPrice',
      'AllowCancelAppointment',
      'AllowEditSchedule',
      'AllowOverrideTax',
      'AllowOverrideGCSeriesBalance',
      'AllowCreateEmailCampaigns',
      'AllowTweetFacebookAsBusiness',
      'AllowCustomizeColors',
      'AllowEditGCTemplates',
      'AllowEditEmailTemplates',
      'AllowSpecials',
      'AllowSpecialsShowView',
      'AllowSpecialsCreate',
      'AllowSpecialsEdit',
      'AllowSpecialsDelete',
      'AllowLoyaltyRewards',
      'AllowLoyaltyRewardsEdit',
      'AllowOverrideInventory',
      'AllowAddProducts',
      'IsReservationistAndAllowModifyTimeClocks',
      'AllowOrderRefund',
      'AllowOrderVoid',
      'AllowModifySchedule',
      'AllowCreateEmployeeProfile',
      'AllowEditEmployeeProfile',
      'AllowDeleteEmployeeProfile',
      'AllowCreateUserLogin',
      'AllowEditUserLogin',
      'AllowDeleteUserLogin',
      'AllowEditEmployeeGroupAssignment',
      'AllowEditEmployeeContractorInfo',
      'AllowEditEmployeeCompensationBenefits',
      'AllowEditEmployeeServices',
      'AllowEditEmployeeRegularSchedule',
      'AllowEditUserLoginOnly',
      'LocationID',
      'BrandID'].each do |attr|
      expect(subject).to respond_to(attr)
    end
  end
end