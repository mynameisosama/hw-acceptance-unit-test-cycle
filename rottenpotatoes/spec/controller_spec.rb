require 'rails_helper'

describe "MovieController" do
    before do
        Movie.create({:title => 'Star Wars', :rating => 'PG', :release_date => '25-May-1977', :director => 'George Lucas'})
        Movie.create({:title => 'Blade Runner', :rating => 'PG', :release_date => '25-Jun-1982', :director => 'Ridley Scott'})
        Movie.create({:title => 'Alien', :rating => 'R', :release_date => '25-May-1979'})
        Movie.create({:title => 'THX-1138', :rating => 'R', :release_date => '11-Mar-1971', :director => 'George Lucas'})
    end

    describe "Display all home page", :type => :request do
        it "displays all movies on the home page" do
            get movies_path
            expect(response.status).to eq(200)
            expect(response).to render_template :index
            expect(response.body).to include("Star Wars")
            expect(response.body).to include("Blade Runner")
            expect(response.body).to include("Alien")
            expect(response.body).to include("THX-1138")
        end
    end
    
    describe "GET New", :type => :request do
        it "New form should display new.html" do
            get new_movie_path
            expect(response.status).to eq(200)
            expect(response).to render_template :new
        end
    end
    
    describe "Edit Movie Information", :type => :request do
        it "Edit form should already be populated with existing data" do
            get edit_movie_path(Movie.find_by(title: 'Star Wars')[:id])
            expect(response.status).to eq(200)
            expect(response.body).to include("Star Wars")
            expect(response.body).to include("George Lucas")
        end
        
        it "Changing director should update the database", :type => :request do
            movie = {
                :title => 'Star Wars', :rating => 'PG', :description => '',
                :release_date => '25-May-1977', :director => 'George Clooney'
            }
            put movie_path(Movie.find_by(title: 'Star Wars')[:id], movie: movie)
            expect(response.status).to eq(302)
            expect(Movie.find_by(title: 'Star Wars')[:director] == 'George Clooney')
        end
    end
    
    describe "Delete a Movie", :type => :request do
        it "remove a valid entry from the data base on delete request" do
            delete movie_path(Movie.find_by(title: 'Star Wars')[:id])
            expect(response.status).to eq(302)
            expect(Movie.find_by(title: 'Star Wars') == nil)
        end
    end
end