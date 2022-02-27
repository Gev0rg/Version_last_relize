require 'date'

def version(paid_till, max_version, min_version, flvget)
  smallest_max = [paid_till, max_version, flvget].select { |i| !i.nil? }.min # наименьший максимум
  version_array = [] # сюда попадут все подходящие версии
  t = true # если останется true, значит не было найдено версии среди пяти последних релизов Флюссоника
  if min_version.nil? # если нет минимума, то в поиске его не учитываю
    [4, 3, 2, 1, 0].each do |i|
      if (flvget << i) <= smallest_max
        version_array << (flvget << i)
        t = false
      end
    end
  else
    [4, 3, 2, 1, 0].each do |i|
      if (flvget << i) <= smallest_max && (flvget << i) >= min_version
        version_array << (flvget << i)
        t = false
      end
    end
  end
  version_array << smallest_max if t # записываю максимум в массив, если не было найдено ни одной версии
  version_array.map! do |x| # перевожу в массив строк для удобства тестирования
    if x.month % 10 != x.month % 100
      "#{x.year % 100}.#{x.month}"
    else
      "#{x.year % 100}.0#{x.month}"
    end
  end
end
