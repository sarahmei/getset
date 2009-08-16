# A progression of Shoes (shoooes.net) applications, from empty to
# a canvas with drawing and buttons. Used in GetSET program curriculum.
# Includes some stuff we didn't get to in class at the end of the file.
# Note: if you run this file as-is, you'll get tons of open windows -
# I recommend running one Shoes.app block at a time.
 
# Step 0 - a blank application
Shoes.app do
 
end
 
# Step 1 - add some text
Shoes.app do
  para "Hello, world"
end
 
# Step 2 - add some attributes to the text
Shoes.app do
  para "Hello, world", :align => "center", :size => "xx-large"
end
 
# Step 3 - custom window title!
Shoes.app :title => "My awesome application" do
  para "Hello, world", :align => "center", :size => "xx-large"
end
 
# Step 4 - background color
Shoes.app :title => "My awesome application" do
  background tomato
  para "Hello, world", :align => "center", :size => "xx-large"
end
 
# Step 5 - text color
Shoes.app :title => "My awesome application" do
  background tomato
  para "Hello, world", :align => "center", :size => "xx-large", 
                       :stroke => saddlebrown
end

# Step 6 - named color method
Shoes.app :title => "My awesome application" do
  def periwinkle
    rgb(180,170,205)
  end
  background periwinkle
  para "Hello, world", :align => "center", :size => "xx-large", 
                       :stroke => saddlebrown
end

# Step 7 - adding a button
Shoes.app :title => "My awesome application" do
  def periwinkle
    rgb(180,170,205)
  end
  background periwinkle

  button "Change the text" do
    @headline.text = "I'm changed!"
  end

  @headline = para "Hello, world", :align => "center", 
                                   :size => "xx-large", 
                                   :stroke => saddlebrown
end

# Step 8 - coordinates
Shoes.app :title => "My awesome application" do
  def periwinkle
    rgb(180,170,205)
  end
  background periwinkle

  animate do 
    @button, @left, @top = self.mouse
    @headline.text = "#{@button} #{@left} #{@top}"
  end

  @headline = para "Hello, world", :align => "center", 
                                   :size => "xx-large",  
                                   :stroke => saddlebrown
end

# Step 9 - drawing lines based on mouse coordinates
Shoes.app :title => "My awesome application" do
  def periwinkle
    rgb(180,170,205)
  end
  background periwinkle

  animate do 
    @button, @left, @top = self.mouse
    line 0, 0, @left, @top
  end

  @headline = para "Draw!", :align => "center", 
                            :size => "xx-large", 
                            :stroke => saddlebrown
end
 
# Step 10 - only drawing a line when the button is down
Shoes.app :title => "My awesome application" do
  def periwinkle
    rgb(180,170,205)
  end
  background periwinkle

  animate do 
    @button, @left, @top = self.mouse
    unless @button == 0
      line 0, 0, @left, @top
    end
  end

  @headline = para "Draw!", :align => "center", 
                            :size => "xx-large", 
                            :stroke => saddlebrown
end
 
# Step 11 - drawing from previous to current coordinates
Shoes.app :title => "My awesome application" do
  def periwinkle
    rgb(180,170,205)
  end
  background periwinkle

  animate do 
    previous_left = @left
    previous_top = @top
    @button, @left, @top = self.mouse
    unless @button == 0
      line previous_left, previous_top, @left, @top
    end
  end

  @headline = para "Draw!", :align => "center", 
                            :size => "xx-large", 
                            :stroke => saddlebrown
end
 
# Step 12 - a clear button
Shoes.app :title => "My awesome application" do
  def periwinkle
    rgb(180,170,205)
  end
  background periwinkle

  animate do 
    previous_left = @left
    previous_top = @top
    @button, @left, @top = self.mouse
    unless @button == 0
      line previous_left, previous_top, @left, @top
    end
  end

  button "Clear" do
    background periwinkle
    @headline.remove
    @headline = para "Draw!", :align => "center", 
                              :size => "xx-large", 
                              :stroke => saddlebrown
  end

  @headline = para "Draw!", :align => "center", 
                            :size => "xx-large", 
                            :stroke => saddlebrown
end

# Allow user to pick background color (didn't get to this in class)
Shoes.app :title => "My awesome application" do
  def periwinkle
    rgb(180,170,205)
  end

  animate do
    previous_left = @left
    previous_top = @top
    @button, @left, @top = self.mouse
    unless @button == 0
      line previous_left, previous_top, @left, @top
    end
  end
 
  def reset_canvas
    clear do
      background @bg_color
      button "Clear" do
        reset_canvas
      end
      button "Background Color" do
        @bg_color = ask_color "Choose a background color"
        reset_canvas
      end
      @headline.remove if @headline
      @headline = para "Draw!", :align => "center", 
                                :size => "xx-large", 
                                :stroke => saddlebrown
    end
  end
 
  @bg_color = periwinkle
  reset_canvas
end 
 
# Let user change line color (didn't get to this in class)
Shoes.app :title => "My awesome application" do
  def periwinkle
    rgb(180,170,205)
  end
 
  def reset_canvas
    clear do
      background @bg_color
      
      button "Clear" do
        reset_canvas
      end
      button "Background Color" do
        @bg_color = ask_color "Choose a background color"
        reset_canvas
      end
      button "Line Color" do
        @line_color = ask_color "Choose a line color"
        reset_canvas
      end
      @headline.remove if @headline
      @headline = para "Draw!", :align => "center", 
                                :size => "xx-large", 
                                :stroke => saddlebrown
    end
  end

  @bg_color = periwinkle
  @line_color = saddlebrown
  
  animate do
    previous_left = @left
    previous_top = @top
    @button, @left, @top = self.mouse
    unless @button == 0
      line previous_left, previous_top, @left, @top, :stroke => @line_color
    end
  end
 
  reset_canvas
end

# Put all the buttons in a column (didn't get to this in class)
Shoes.app :title => "My awesome application" do
  def periwinkle
    rgb(180,170,205)
  end
 
  def reset_canvas
    clear do
      background @bg_color
      stack :width => 120 do 
        button "Clear", :width => 120 do
          reset_canvas
        end
        button "Background Color", :width => 120 do
          @bg_color = ask_color "Choose a background color"
          reset_canvas
        end
        button "Line Color", :width => 120 do
          @line_color = ask_color "Choose a line color"
          reset_canvas
        end
      end
      @headline.remove if @headline
      @headline = para "Draw!", :align => "center", 
                                :size => "xx-large", 
                                :stroke => saddlebrown
    end
  end

  @bg_color = periwinkle
  @line_color = saddlebrown
  
  animate do
    previous_left = @left
    previous_top = @top
    @button, @left, @top = self.mouse
    unless @button == 0
      line previous_left, previous_top, @left, @top, :stroke => @line_color
    end
  end
 
  reset_canvas
end
