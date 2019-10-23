module MoviesHelper
  def self.get_sort_order(sort)
    case sort
      when 'title'
        ordering, title_header = {:title => :asc}, 'hilite'
      when 'release_date'
        ordering, date_header = {:release_date => :asc}, 'hilite'
    end
    return ordering, title_header, date_header
  end
end
