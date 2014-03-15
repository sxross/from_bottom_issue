class MainController < UIViewController 
  PADDING = 20
  
  def viewDidLoad
    super

    # Sets a top of 0 to be below the navigation control
    self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = MainStylesheet
    init_nav
    rmq(self.view).apply_style :root_view
    
    @status_label = rmq.append(UILabel, :status).get

    # Create your UIViews here
    @top_button        = rmq.append(UIButton, :top_button).on(:tap) do |sender, event|
      if sender.currentTitle == 'use :from_bottom'
        rmq(:bottom_button).style{|st| st.from_bottom = 64 + PADDING}
        sender.setTitle('add padding', forState:UIControlStateNormal)
        @status_label.text = 'add padding'
      else
        rmq(:bottom_button).style{|st| st.from_bottom = PADDING}
        sender.setTitle('use :from_bottom', forState:UIControlStateNormal)
        @status_label.text = ':from_bottom'
      end
    end
    @bottom_buttom     = rmq.append(UIButton, :bottom_button).get
  end
  
  def init_nav
    self.title = 'Title Here'

    self.navigationItem.tap do |nav|
      nav.leftBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAction,
                                                                           target: self, action: :nav_left_button)
      nav.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh,
                                                                           target: self, action: :nav_right_button)
    end
  end

  def nav_left_button
    puts 'Left button'
  end

  def nav_right_button
    puts 'Right button'
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end

end


__END__

# You don't have to reapply styles to all UIViews, if you want to optimize, 
# another way to do it is tag the views you need to restyle in your stylesheet, 
# then only reapply the tagged views, like so:
def logo(st)
  st.frame = {t: 10, w: 200, h: 96}
  st.centered = :horizontal
  st.image = image.resource('logo')
  st.tag(:reapply_style)
end

# Then in willAnimateRotationToInterfaceOrientation
rmq(:reapply_style).reapply_styles


