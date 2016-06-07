require 'rails_helper'

RSpec.describe Goal, type: :model do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:completion) }
  it { should validate_presence_of(:user) }

end
