FormtasticDatepickerInputs
==========================

This plugin is based on a blog post by Grzegorz Brzezinka: http://blog.brzezinka.eu/webmaster-tips/ruby/ruby-on-rails-formtastic-jquery-ui-datepicker

The concept is simple. It adds a new input into formtastic that can be used like this: 
 
	<% semantic_form_for @master do |f| -%>
		<% f.inputs do -%>
		  <%= f.input :name %>
		  <%= f.input :born, :as => :date_picker %>
		<% end -%>
		<%= f.buttons %>
	<% end -%>

It adds a class onto a normal text input called 'ui-date-picker', and the parent &lt;li> it adds a class called 'date_picker.' Assuming you have already referenced jquery, and jqueryui in your layout, You can then hook this with a call from jquery:

	$(document).ready(function(){
		$('input.ui-date-picker').datepicker();
	});

Development Environment
=======================

We currently support both Rails 2 and Rails 3, under Ruby 1.8.7-ish (and 1.9.2-ish). That means, at a bare minimum, you'll want to set-up two rvm gemsets to run your specs against. So, fork the project on Github, clone it, make some gemsets, run bundler, run your specs and then finally set-up an .rvmrc file that specifies Rails 3 as your default gemset and cd back into that directory to load in the .rvmrc file. Something like this:

<pre>
  $ cd ~/code/formtastic
  $ rvm gemset create formtastic-rails3
  $ rvm gemset use formtastic-rails3
  $ gem install bundler
  $ bundle install
  $ rake spec
  $ rm Gemfile.lock
  $ rvm gemset create formtastic-rails2
  $ rvm gemset use formtastic-rails2
  $ gem install bundler
  $ RAILS_2=true bundle install
  $ RAILS_2=true rake spec
  $ touch .rvmrc
  $ echo "rvm gemset use formtastic-rails-3" > .rvmrc
  $ cd ~/code/formtastic
</pre>

Also, most of the testing environment has been copied straight of formtastic, so if something doesn't make sense here, it probably did where I grabbed it from.

Contributors
============

* Grzegorz Brzezinka
* Nik Petersen
* Alan Harper
