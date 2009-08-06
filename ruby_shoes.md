!SLIDE 
<img src="img/ruby_logo.jpg" height="300">
# GetSET Ruby Workshop
### Sarah Mei
### August 5th, 2009
### http://github.com/sarahmei/getset

!SLIDE

Doing fun stuff with code

!SLIDE



What is a program?

!SLIDE 

<table><tr><td valign="center">
<img src="img/os_x_logo.jpg">
</td><td valign="center">
<img src="img/windows_logo.gif">
</td><td valign="center">
<img src="img/linux_logo.gif">
</td></tr></table>

!SLIDE

<img src="img/acrobat.jpg">
<img src="img/finder.png">
<img src="img/firefox.png">
<img src="img/itunes.png">
<img src="img/quicktime.jpg">
<img src="img/safari.png">
<br/>
<img src="img/ms_office.png">
<br/>
<img src="img/wordpress.jpg">

!SLIDE centereverything

<img src="img/web_app_in_rails.jpg">

!SLIDE

How do I write one?

!SLIDE

* Learn about customer's requirements
* Translate to "stories"
* Pick a story that seems doable
* Write code that does it
* Show your work to the customer, get feedback
* Based on feedback, adjust your stories
* When a story is done, go back to "pick a story"
* Repeat until app is finished!

!SLIDE

## Let's start writing code!

!SLIDE

<table width="100%"><tr><td width="50%" align="center">
<img src="img/git_bash.png">
</td><td width="50%" align="center">
<img src="img/mac_terminal_sm.png">
</td></tr><tr><td align="center">
Windows
</td><td align="center">
Mac OS X
</td></tr></table>

!SLIDE centereverything

<span class="big-text"><pre><code>
irb
</code></pre></span>

!SLIDE

## Variables
### words that hold information

<pre><code>
> my_variable = 5
=> 5
> my_other_variable = "hi"
=> "hi"
</code></pre>

!SLIDE

## Types of information

### text, numbers...collections?

<pre><code>
> fruits = ["kiwi", "strawberry", "plum"]
=> ["kiwi", "strawberry", "plum"]
> states = {"CA" => "California", "DE" => "Delaware"}
=> {"DE"=>"Delaware", "CA"=>"California"}
</code></pre>

!SLIDE

## Operators

### doing stuff with variables

<pre><code>
> my_variable + 2
=> 7
> my_variable * 3
=> 15
> my_fruits = my_fruits + ["lychee"]
=> ["kiwi", "strawberry", "plum", "lychee"]
> my_fruits = my_fruits - ["lychee"]
=> ["kiwi", "strawberry", "plum"]
</code></pre>

!SLIDE

## Loops

### doing the same thing a bunch of times

<table><tr><td width="37%" valign="top">
<code><b>
> puts fruits[0]<br/>
kiwi<br/>
=> nil<br/>
> puts fruits[1]<br/>
strawberry<br/>
=> nil<br/>
> puts fruits[2]<br/>
plum<br/>
=> nil
</b></code>
</td>
<td width="6%"><font size="150%">VS</font></td>
<td width="57%" valign="top">
<code><b>
> fruits.each do |f|<br/>
*   puts f<br/>
> end<br/>
kiwi<br/>
strawberry<br/>
plum<br/>
=> ["kiwi", "strawberry", "plum"]
</b></code>
</td></tr></table>

!SLIDE

## Conditionals

### doing something only if a condition is met

<pre><code>
> fruits.each do |f|
*   puts f if f == "plum"
> end
plum
=> ["kiwi", "strawberry", "plum"]
</code></pre>

!SLIDE

## Now we've done some Ruby...
## ...let's do some Rails!

!SLIDE centereverything

<img src="img/web-application.png">

!SLIDE centereverything

<img src="img/mvc.jpg">

