require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { is_expected.to have_field(:name) }
  it { is_expected.to have_field(:short) }
  it { is_expected.to have_field(:gender) }
  it { is_expected.to have_field(:color) }
  it { is_expected.to have_field(:email) }
  it { is_expected.to have_field(:mobile) }
  it { is_expected.to have_field(:partner_id) }
  it { is_expected.to have_field(:firstname) }
  it { is_expected.to have_field(:lastname) }
  it { is_expected.to have_many(:groups) }
  it { is_expected.to have_many(:lessons) }
end
