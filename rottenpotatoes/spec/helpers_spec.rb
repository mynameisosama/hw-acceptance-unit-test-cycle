require 'rails_helper'

describe "MoviesHelper" do
    describe "get_sort_order" do
        it "should order with respect to title when sort is title" do
            expect(MoviesHelper.get_sort_order('title') == [{:title => :asc}, 'hilite', nil])
        end
        
        it "should order with respect to release_date when sort is release_date" do
            expect(MoviesHelper.get_sort_order('release_date') == [{:release_date => :asc}, nil, 'hilite'])
        end
        
        it "should not order when sort is nil" do
            expect(MoviesHelper.get_sort_order(nil) == [nil, nil, nil])
        end
    end
end