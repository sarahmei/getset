# A progression of Shoes (shoooes.net) applications, from empty to
# a canvas with drawing and buttons. Used in GetSET program curriculum.
# Note: if you run this file as-is, you'll get tons of open windows -
# I recommend running one Shoes.app block at a time.
 
# Empty application
Shoes.app do
 
end
 
# Add some text
Shoes.app do
  para "Hello, world"
end
 
# Now let's center it in the window
Shoes.app do
  para "Hello, world", :align => 'center'
end
 
# Bigger!
Shoes.app do
  para "Hello, world", :align => 'center', :size => 'xx-large'
end
 
# Custom window title!
Shoes.app :title => "My awesome application" do
  para "Hello, world", :align => 'center', :size => 'xx-large'
end
 
# Background color! Try other named colors!
Shoes.app :title => "My awesome application" do
  background tomato
  para "Hello, world", :align => 'center', :size => 'xx-large'
end
 
# Move mouse around to get line from 0,0 to current location
Shoes.app :title => "My awesome application" do
  background tomato
  para "Hello, world", :align => 'center', :size => 'xx-large'
 
  animate do
    button, left, top = self.mouse
    line 0, 0, left, top
  end
end
 
# Get line from 0,0 to current location only when mouse button is down
Shoes.app :title => "My awesome application" do
  background tomato
  para "Hello, world", :align => 'center', :size => 'xx-large'
  animate do
    button, left, top = self.mouse
    line 0, 0, left, top unless button == 0
  end
end
 
# Click to draw - line will follow mouse
Shoes.app :title => "My awesome application" do
  background tomato
  para "Hold mouse button to draw!", :align => 'center', :size => 'xx-large'
  animate do
    button, left, top = self.mouse
    if @prev_left and @prev_top and button != 0
      line @prev_left, @prev_top, left, top
    end
    @prev_left = left
    @prev_top = top
  end
end
 
# Add clear button
Shoes.app :title => "My awesome application" do
 
  canvas = DrawingCanvas.new(self)
  canvas.reset
 
  animate do
    button, left, top = self.mouse
    if @prev_left and @prev_top and button != 0
      line @prev_left, @prev_top, left, top
    end
    @prev_left = left
    @prev_top = top
  end
end
 
class DrawingCanvas
  def initialize(area)
   debug area.class.name
    @flow = area
    reset
  end
 
  def reset
    canvas = self
    @flow.app do
      clear do
        background tomato
        para "Hold mouse button to draw!", :align => 'center', :size => 'xx-large'
        canvas.clear_button
      end
    end
  end
 
  def clear_button
    canvas = self
    @flow.app do
      button "Clear" do
        canvas.reset
      end
    end
  end
end
 
# Add a clear button (simpler implementation)
Shoes.app :title => "My awesome application" do
 
  animate do
    button, left, top = self.mouse
    if @prev_left and @prev_top and button != 0
      line @prev_left, @prev_top, left, top
    end
    @prev_left = left
    @prev_top = top
  end
 
  def reset_canvas
    clear do
      background tomato
      para "Hold mouse button to draw!", :align => 'center', :size => 'xx-large'
      button "Clear" do
        reset_canvas
      end
    end
  end
 
  reset_canvas
end
 
# Allow user to pick background color
Shoes.app :title => "My awesome application" do
 
  animate do
    button, left, top = self.mouse
    if @prev_left and @prev_top and button != 0
      line @prev_left, @prev_top, left, top
    end
    @prev_left = left
    @prev_top = top
  end
 
  def reset_canvas
    clear do
      background tomato
      para "Hold mouse button to draw!", :align => 'center', :size => 'xx-large'
      button "Clear" do
        reset_canvas
      end
      button "Change Background" do
        new_color = ask_color "Choose a background color"
        background new_color
      end
    end
  end
 
  reset_canvas
end
 
# Make it so we always get our buttons and headline back
Shoes.app :title => "My awesome application" do
 
  animate do
    button, left, top = self.mouse
    if @prev_left and @prev_top and button != 0
      line @prev_left, @prev_top, left, top
    end
    @prev_left = left
    @prev_top = top
  end
  
  @background_color = tomato
 
  def reset_canvas
    clear do
      background @background_color
      para "Hold mouse button to draw!", :align => 'center', :size => 'xx-large'
      button "Clear" do
        reset_canvas
      end
      button "Change Background" do
        @background_color = ask_color "Choose a background color"
        reset_canvas
      end
    end
  end
 
  reset_canvas
end
 
# Let user change line color
Shoes.app :title => "My awesome application" do
 
  animate do
    button, left, top = self.mouse
    if @prev_left and @prev_top and button != 0
      stroke @line_color
      line @prev_left, @prev_top, left, top
    end
    @prev_left = left
    @prev_top = top
  end
  
  @background_color = tomato
  @line_color = black
 
  def reset_canvas
    clear do
      background @background_color
      para "Hold mouse button to draw!", :align => 'center', :size => 'xx-large'
      button "Clear" do
        reset_canvas
      end
      button "Change Background" do
        @background_color = ask_color "Choose a background color"
        reset_canvas
      end
      button "Change Line Color" do
        @line_color = ask_color "Choose a line color"
      end
    end
  end
  
  reset_canvas
end
 