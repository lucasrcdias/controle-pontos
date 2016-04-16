require 'spec_helper'

class DummyPoint < ActiveRecord::Base
  self.table_name = :points

  belongs_to :worker

  validates_with PointLimitValidator
end

describe PointLimitValidator do
  let(:worker) { create(:pf_worker) }
  let(:points) do
    4.times do
      DummyPoint.create({
        worker: worker,
        date: Date.today,
        latitude: FFaker::Geolocation.lat,
        longitude: FFaker::Geolocation.lng
      })
    end
  end

  it "should not accept more than 4 point per day" do
    points

    extra_point = DummyPoint.new({
      worker: worker,
      date: Date.today,
      latitude: FFaker::Geolocation.lat,
      longitude: FFaker::Geolocation.lng
    })

    expect(extra_point).not_to be_valid
    expect(extra_point.errors[:base]).to include(I18n.t('activerecord.errors.models.point.base.limit_reached'))
  end
end
