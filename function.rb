require 'date'

def version(paid_till, max_version, min_version, flvget)
  maximum = [paid_till, max_version, flvget].select { |i| !i.nil? }
  max = maximum.min
  massiv = []
  t = 0 # если останется равен нулю, значит не было найдено версии среди пяти последних релизов Флюссоника
  if min_version.nil?
    [4, 3, 2, 1].each do |i|
      if (flvget << i) <= max
        massiv << (flvget << i)
        t += 1
      end
    end
  else
    [4, 3, 2, 1].each do |i|
      if (flvget << i) <= max && (flvget << i) >= min_version
        massiv << (flvget << i)
        t += 1
      end
    end
  end
  massiv << max if t == 0
  massiv.map! do |x|
    if x.month % 10 != x.month % 100
      "#{x.year % 100}.#{x.month}"
    else
      "#{x.year % 100}.0#{x.month}"
    end
  end
end
