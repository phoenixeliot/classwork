require 'tree'

describe Tree do
  it "should initialize with a value" do
    tree = Tree.new 5
    tree.root.value { should be 5 }
  end
  
end