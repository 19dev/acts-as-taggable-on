acts-as-taggable-on

Komutlar,

	$ rails generate acts_as_taggable_on:migration
	$ rake db:migrate

User model,

	$ rails g model User name:string
	$ rake db:migrate

İlişkisellik, ![ilişki](http://yuml.me/fd245769.jpg)

	$ vim app/model/user.rb
	class User < ActiveRecord::Base
	  acts_as_taggable
	  acts_as_taggable_on :skills, :interests
	end

Konsol,

	> @user = User.new(:name => "Bobby")
	> @user.tag_list = ["awesome", "slick", "hefty"]
	> @user.skill_list = ["joking", "clowning", "boxing"]
	> @user.tag_list
	=> ["awesome", "slick", "hefty"]
	> @user.save

Tüm tag'leri bir arada görmek istersen,

	> y ActsAsTaggableOn::Tag.all
	ActsAsTaggableOn::Tag Load (0.3ms)  SELECT "tags".* FROM "tags"
	---
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 1
	    name: awesome
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 2
	    name: slick
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 3
	    name: hefty
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 4
	    name: joking
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 5
	    name: clowning
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 6
	    name: boxing
	=> nil

Kullanıcının tag'lerine bakalım,

	> y User.last.tags
	> y User.last.skills

Kullanıcıyı oluştururken doğrudan tag'leyebilirsin,

	> User.create(name: "Frankie", skill_list: "joking, flying, eating")

burada "foo, bar" aslında ["foo", "bar"] ile aynı.

Bunları saydırmak mümkün,

	> y User.skill_counts.all
	---
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 4
	    name: joking
	    count: 2
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 5
	    name: clowning
	    count: 1
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 6
	    name: boxing
	    count: 1
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 7
	    name: flying
	    count: 1
	- !ruby/object:ActsAsTaggableOn::Tag
	  attributes:
	    id: 8
	    name: eating
	    count: 1
	=> nil
	>

# Kaynak

- https://github.com/mbleigh/acts-as-taggable-on
