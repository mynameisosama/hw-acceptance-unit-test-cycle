require 'rails_helper'

describe "Movie" do
    describe "all_ratings" do
        it "should provide all ratings" do
            expect(Movie.all_ratings == ['G', 'PG', 'PG-13', 'NC-17', 'R'])
        end
    end
    
    describe "similar_movies" do
        before do
            Movie.create({:title => 'Star Wars', :rating => 'PG', :release_date => '25-May-1977', :director => 'George Lucas'})
            Movie.create({:title => 'Blade Runner', :rating => 'PG', :release_date => '25-Jun-1982', :director => 'Ridley Scott'})
            Movie.create({:title => 'Alien', :rating => 'R', :release_date => '25-May-1979'})
            Movie.create({:title => 'THX-1138', :rating => 'R', :release_date => '11-Mar-1971', :director => 'George Lucas'})
        end
        
        it "should provide a list of all titles that have the same director" do
            expect(Movie.similar_movies("Star Wars") == ["Start Wars", "THX-1138"])
        end
        
        it "should do nothing if director for a movie doesn't exist" do
            expect(Movie.similar_movies("Alien") == nil)
        end
    end
end