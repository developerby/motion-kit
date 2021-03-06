describe MotionKit::Layout do
  before do
    @subject = TestLayout.new
  end

  it "should be an instance of MotionKit::Layout" do
    @subject.should.be.kind_of(MotionKit::Layout)
  end

  it "should be an instance of MK::Layout" do
    @subject.should.be.kind_of(MK::Layout)
  end

  it "should add a UIView subview with the name :basic_view" do
    view = @subject.view.subviews.find { |view| view.motion_kit_id == :basic_view }
    view.should.be.kind_of(UIView)
  end

  it "should add two subviews under :basic_view" do
    @subject.view.subviews.first.subviews.length.should == 2
  end

  it "should add a UIButton as the first subview under :basic_view" do
    @subject.view.subviews.first.subviews.first.should.be.kind_of UIButton
  end

  it "should add a UILabel as the second subview under :basic_view" do
    @subject.view.subviews.first.subviews[1].should.be.kind_of UILabel
  end

  it "should allow getting the subviews by their id" do
    @subject.get(:basic_view).should.be.kind_of UIView
    @subject.get(:basic_view, in: @subject.view).should.be.kind_of UIView
    @subject.get(:basic_view, in: @subject.view).should == @subject.get(:basic_view)

    @subject.get(:basic_button).should.be.kind_of UIButton
    @subject.get(:basic_button, in: @subject.view).should.be.kind_of UIView
    @subject.get(:basic_button, in: @subject.view).should == @subject.get(:basic_button)

    @subject.get(:basic_label).should.be.kind_of UILabel
    @subject.get(:basic_label, in: @subject.view).should.be.kind_of UIView
    @subject.get(:basic_label, in: @subject.view).should == @subject.get(:basic_label)
  end

  it "should allow getting the subviews by first, last and nth child" do
    @subject.first(:repeated_label_3).should.be.kind_of UIView
    @subject.first(:repeated_label_3, in: @subject.other_view).should.be.kind_of UIView
    @subject.nth(:repeated_label_3, 1).should.be.kind_of UIButton
    @subject.nth(:repeated_label_3, at: 1, in: @subject.other_view).should.be.kind_of UIButton
    @subject.last(:repeated_label_3).should.be.kind_of UILabel
    @subject.last(:repeated_label_3, in: @subject.other_view).should.be.kind_of UILabel
  end

  it "should allow getting all the subviews by name" do
    views = @subject.all(:repeated_label_3)
    views.length.should == 3
    views[0].should.be.kind_of UIView
    views[1].should.be.kind_of UIButton
    views[2].should.be.kind_of UILabel

    views = @subject.all(:repeated_label_3, in: @subject.other_view)
    views.length.should == 3
    views[0].should.be.kind_of UIView
    views[1].should.be.kind_of UIButton
    views[2].should.be.kind_of UILabel
  end

  it "should support missing methods" do
    -> do
      @subject.foo_bar_baz
    end.should.raise(NoMethodError)
  end

end
