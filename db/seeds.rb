# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create!(title: 'Effective C++: 55 Specific Ways to Improve Your Programs and Designs (3rd Edition)',
	description:
		%{<p>
			The first two editions of Effective C++ were embraced by hundreds of thousands of programmers worldwide. The reason is clear: Scott Meyers’ practical approach to C++ describes the rules of thumb used by the experts — the things they almost always do or almost always avoid doing — to produce clear, correct, efficient code.
			The book is organized around 55 specific guidelines, each of which describes a way to write better C++. Each is backed by concrete examples. For this third edition, more than half the content is new, including added chapters on managing resources and using templates. Topics from the second edition have been extensively revised to reflect modern design considerations, including exceptions, design patterns, and multithreading.
		},
		image_url: 'c++.jpg',
		price: 32.75)

Product.create!(title: 'Effective STL: 50 Specific Ways to Improve Your Use of the Standard Template Library',
	description:
		%{<p>
			C++’s Standard Template Library is revolutionary, but learning to use it well has always been a challenge. Until now. In this book, best-selling author Scott Meyers ( Effective C++ , and More Effective C++ ) reveals the critical rules of thumb employed by the experts – the things they almost always do or almost always avoid doing – to get the most out of the library.
Other books describe what’s in the STL. Effective STL shows you how to use it. Each of the book’s 50 guidelines is backed by Meyers’ legendary analysis and incisive examples, so you’ll learn not only what to do, but also when to do it – and why.
		},
		image_url: 'stl.jpg',
		price: 32.75)

Product.create!(title: 'C++ Concurrency in Action: Practical Multithreading',
	description:
		%{<p>
			As a guide and reference to the new concurrency features in the upcoming C++ Standard and TR2, this book is invaluable for existing programmers familiar with writing multi-threaded code in C++ using platform-specific APIs, or in other languages, as well as C++ programmers who have never written multithreaded code before.
		},
		image_url: 'Concurrency.jpg',
		price: 64.79)