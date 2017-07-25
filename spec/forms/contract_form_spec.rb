require 'rails_helper'

RSpec.describe ContractForm, type: :model do

  def valid_params
    {
      currency_amount: 10
    }
  end

  let(:klas)   { described_class         }
  subject      { klas.new(valid_params)  }

  describe "Attributes" do
    it { should respond_to :contract               }
    it { should respond_to :currency_amount        }
  end

  describe "Methods" do
    it { should respond_to :save                 }
  end

  describe "Object Existence" do
    it { should be_a klas   }
    it { should be_valid    }
  end

  describe "Subobjects" do
    it { should respond_to :subobject_symbols }
    it { should respond_to :subobjects        }
    it { should respond_to :subs              }
    it 'returns an array' do
      expect(subject.subobjects).to be_an(Array)
    end
  end

  describe "Delegated Object" do
    it 'has a present Contract' do
      expect(subject.contract).to be_present
    end

    it 'has a Contract with the right class' do
      expect(subject.contract).to be_a(Contract)
    end

    it 'should have a valid Contract' do
      expect(subject.contract).to be_valid
    end
  end

  describe "Object Saving" do
    it 'saves the object to the database' do
      subject.save
      expect(subject).to be_valid
    end

    it 'gets the right object count' do
      expect(Contract.count).to eq(0)
      subject.save
      expect(Contract.count).to eq(1)
    end
  end
end

