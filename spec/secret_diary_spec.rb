require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do

  let(:diary) {double :diary}

  context "when locked" do

    it "refuses to be read" do
      expect(diary).to receive(:read).and_return("Go away!")
      expect(diary.read).to eq "Go away!"
    end

    it "refuses to be written" do
      expect(diary).to receive(:write).and_return("Go away!")
      expect(diary.write).to eq "Go away!"
    end

  end

  context "when unlocked" do

    it "gets read" do
      expect(diary).to receive(:unlock).and_return(true)
      diary.unlock
      expect(diary).to receive(:read).and_return("Hamish's diary")
      expect(diary.read).to eq "Hamish's diary"
    end

    it "gets written" do
      expect(diary).to receive(:unlock).and_return(true)
      diary.unlock
      expect(diary).to receive(:write).and_return(nil)
      expect(diary.write).to eq nil
    end
  end
end
