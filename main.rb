require "./network"
require "./sorter"

words = Network.fetch("http://www.gutenberg.org/files/974/974-0.txt").split(" ")

s = Sorter.new
sorted = s.sort(words)
s.display(sorted, 20)
s.histogram(sorted, 5)