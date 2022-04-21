require 'date'

def version(paid_till, max_version, min_version, flvget)
  smallest_max = [paid_till, max_version, flvget].select { |i| !i.nil? }.min # наименьший максимум
  version_array = [] # сюда попадут все подходящие версии
  t = true # если останется true, значит не было найдено версии среди пяти последних релизов Флюссоника
  min_version = Date.new(988, 1) if min_version.nil? # если нет минимума, то устанавливаю дату принятия
  4.downto(0) do |i|                                 # христианства на Руси ;)
    if (flvget << i) <= smallest_max && (flvget << i) >= min_version
      version_array << (flvget << i)
      t = false
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
