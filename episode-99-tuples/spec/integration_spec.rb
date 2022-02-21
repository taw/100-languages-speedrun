describe "loop" do
  let(:expected_output) { (Pathname(__dir__) + "integration/#{path}").read }
  let(:command) { "./tuples.rb examples/#{path}" }
  subject(:actual_output) { `#{command}` }

  ## Plain output
  describe "fib" do
    let(:path) { "fib.txt" }
    it { is_expected.to eq(expected_output) }
  end

  describe "fizzbuzz" do
    let(:path) { "fizzbuzz.txt" }
    it { is_expected.to eq(expected_output) }
  end

  describe "hello" do
    let(:path) { "hello.txt" }
    it { is_expected.to eq(expected_output) }
  end

  describe "loop" do
    let(:path) { "loop.txt" }
    it { is_expected.to eq(expected_output) }
  end

  describe "mini_fizzbuzz" do
    let(:path) { "mini_fizzbuzz.txt" }
    it { is_expected.to eq(expected_output) }
  end

  describe "mini_loop" do
    let(:path) { "mini_loop.txt" }
    it { is_expected.to eq(expected_output) }
  end

  ## Infinite output
  describe "infinite_loop" do
    let(:path) { "infinite_loop.txt" }
    subject(:actual_output) { `#{command} | head -n 100` }
    it { is_expected.to eq(expected_output) }
  end

  describe "yes" do
    let(:path) { "yes.txt" }
    subject(:actual_output) { `#{command} | head -n 100` }
    it { is_expected.to eq(expected_output) }
  end

  ## Random
  describe "dice" do
    let(:path) { "dice.txt" }
    it { is_expected.to match(/\A(\d\n){4}\z/) }
  end

  ## Non-interactive input
  describe "echo" do
    let(:path) { "echo.txt" }
    subject(:actual_output) { `echo "Alice\nBob" | #{command}` }
    it {
      is_expected.to eq(expected_output)
    }
  end

  describe "hello_name" do
    let(:path) { "hello_name.txt" }
    subject(:actual_output) { `echo "Alice\nBob" | #{command}` }
    it { is_expected.to eq(expected_output) }
  end

  ## File processing
  describe "print_file" do
    let(:path) { "print_file.txt" }
    subject(:actual_output) { `#{command} spec/data/a.txt` }
    it { is_expected.to eq(expected_output) }
  end

  describe "count_lines" do
    let(:path) { "count_lines.txt" }

    describe "A" do
      subject(:actual_output) { `#{command} spec/data/a.txt` }
      it { is_expected.to eq("3\n") }
    end

    describe "D" do
      subject(:actual_output) { `#{command} spec/data/d.txt` }
      it { is_expected.to eq("12\n") }
    end
  end

  describe "print_files" do
    let(:path) { "print_files.txt" }
    subject(:actual_output) { `#{command} spec/data/a.txt spec/data/b.txt spec/data/c.txt` }
    it { is_expected.to eq(expected_output) }
  end

  describe "random_word" do
    let(:path) { "random_word.txt" }
    subject(:actual_output) { `#{command} spec/data/wordle-answers-alphabetical.txt` }
    it { is_expected.to match(/\A[a-z]{5}\n\z/) }
  end

  describe "sum" do
    let(:path) { "sum.txt" }

    describe "Numbers" do
      subject(:actual_output) { `#{command} spec/data/numbers.txt` }
      it { is_expected.to eq("69\n") }
    end

    describe "Budget" do
      subject(:actual_output) { `#{command} spec/data/budget.txt` }
      it { is_expected.to eq("4900\n") }
    end
  end
end
