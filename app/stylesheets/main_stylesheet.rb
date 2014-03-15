class MainStylesheet < ApplicationStylesheet
  PADDING = 20
  
  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def top_button(st)
    st.frame = {w: 150, h: 40}
    st.color = color.white
    st.background_color = color.blue
    st.centered = :horizontal
    st.text  = 'use :from_bottom'
    st.top   = 20
  end
  
  def status(st)
    st.frame = {w: 150, h: 40}
    st.top   = 60
    st.color = color.black
    st.centered = :horizontal
    st.text = 'use :from_bottom'
  end

  def bottom_button(st)
    st.frame = {w: 100, h: 40}
    st.color = color.white
    st.background_color = color.blue
    st.text  = 'at bottom'
    st.centered = :horizontal
    st.from_bottom = PADDING   # should line bottom of button up 20px from bottom
  end
end
