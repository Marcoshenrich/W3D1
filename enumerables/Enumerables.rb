


class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            ele = self[i]
            prc.call(ele)
            i += 1
        end
        self
    end

    def my_select(&prc)
        resarr = []
        self.my_each do |ele|
            resarr << ele if prc.call(ele)
        end
        resarr
    end
    
    def my_reject(&prc)
        resarr = []
        self.my_each do |ele|
            resarr << ele unless prc.call(ele)
        end
        resarr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        count = 0
        self.my_each do |ele|
            count += 1 if prc.call(ele)
        end
        return true if count == self.length
        false
    end

    def my_flatten(data)
        return [data] unless data.instance_of?(Array)
        resarr = []
    
        data.each do |ele|
            if ele.instance_of?(Array)
                resarr.concat(my_flatten(ele))
            else
                resarr.concat([ele])
            end
        end
        resarr
    end

    def my_zip(*otherarrs)
        resarr = Array.new(self.length) {Array.new}

        (self.length).times do |i|
            resarr[i] << self[i]
        end

        (self.length).times do |i|
            (otherarrs.length).times do |j|
                resarr[i] << otherarrs[j][i]
            end
        end

        resarr
    end

    def my_rotate(rot=1)
        resar = []
        (self.length).times do |i|
            resar << self[(i + rot) % self.length]
        end
        resar
    end

    def my_join(sep="")
        resstr = ""
        self.each_with_index do |ele, i|
            resstr += ele.to_s
            resstr += sep unless i == self.length - 1
        end
        resstr
    end

    def my_reverse
        resarr = []
        i = self.length - 1
        while i >= 0
            resarr << self[i]
            i -= 1
        end
        resarr
    end

end

dictionary = ["i","zza", "pizza","tempt"]

def substrings(word, dictionary)
    resarr = []
    i = 0
    while i < word.length
        j = i
        while j < word.length
            resarr << word[i..j] if dictionary.include?(word[i..j])
            j += 1
        end
        i += 1
    end
    resarr
end


def factors(num)
    factarr = []
    (1..num).each do |factor|
      factarr << factor if num % factor == 0
    end
    factarr
  end



  def bubble_sort!(arr, &prc)
    prc ||= Proc.new { |ele1, ele2| ele1 <=> ele2 }
    sorted = false
    p arr.object_id
    until sorted
        sorted = true
        i = 0
        while i < arr.length - 1
            if prc.call(arr[i], arr[i + 1]) == 1
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                sorted = false
            end
            i += 1
        end

    end
    p arr.object_id
    arr
  end


  def bubble_sort(arr, &prc)
    prc ||= Proc.new { |ele1, ele2| ele1 <=> ele2 }
    sorted = false
    resarr = arr.clone

    until sorted
        sorted = true
        i = 0
        while i < resarr.length - 1
            if prc.call(resarr[i], resarr[i + 1]) == 1
                resarr[i], resarr[i + 1] = resarr[i + 1], resarr[i]
                sorted = false
            end
            i += 1
        end

    end
    resarr
  end

#   bubble_sort(arr)
arr = [1,34,7,8,32,6,7]

#cd desktop/aa/w3/d1
#load "enumerables.rb"
