require 'rails_helper'

describe TweetPolicy do
  subject { described_class.new(user, tweet) }

  let(:tweet) { create(:tweet) }

  context 'being a visitor' do
    let(:user) { create(:user) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_edit_and_update_actions}
  end

  context 'being an administrator' do
    let(:user) { create(:admin) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_edit_and_update_actions}
  end
end
