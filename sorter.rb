require "uri"
require "unicode_utils/display_width"

class Sorter
  # given an array of words, returns an array of hashes ({ :word, :count }) sorted by count DESC
  def sort(words)
    counts = Hash.new(0)
    words.each do |word|
      # naive data clean up: removes some special characters + downcase words
      word = word.downcase.gsub(/[!#$^&*,;\.\/]/, "")
      
      # drops short words 
      counts[word] += 1 if word.length > 2
    end

    # maps to array of obj for sorting
    arr = counts.map { |word, freq| { word: word, count: freq } }

    # sorts array by word count and reverses
    sorted = arr.sort_by { |hash| hash[:count] }.reverse
  end

  # given a sorted array of words, it displays the top :limit words and their counts to the console
  def display(words, limit)
    puts "[ Top #{limit} words ]"
    for i in 0...limit
      puts "#{words[i][:word]} (#{words[i][:count]})"
    end
  end

  # given a sorted array of words, it displays the top :limit words in the console as an histogram
  def histogram(words, limit)
    puts "[ Histogram: Top #{limit} words ]"
    
    # loops to get the lenght of the longest word for left padding
    # UnicodeUtils adds some complexity but ensures that the chars are displayed correctly
    max = 0
    for i in 0...limit
      lenght = UnicodeUtils.display_width(words[i][:word])
      max = lenght if lenght > max
    end

    # naive scaling. proper implementation should adapt base according to word counts
    for i in 0...limit
      pad_str = " " * (max - UnicodeUtils.display_width(words[i][:word]))
      puts "#{pad_str}#{words[i][:word]}: #{"|" * (words[i][:count] / 40)}"
    end
  end
end