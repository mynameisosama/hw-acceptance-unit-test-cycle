Feature: update certain information of a mvoie
 
  As an avid movie critic
  So that I can quickly update any errors about movie
  I want to update a some information of a movie

Background: movies have been added to database
  
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page

Scenario: Add Description to the movie
  When I go to the edit page for "Aladdin"
  And  I fill in "Description" with "Arabian Nights!!!"
  And  I press "Update Movie Info"
  Then the description of "Aladdin" should be "Arabian Nights!!!"
  And I should be on the details page for "Aladdin"
  And I should see "Aladdin was successfully updated."
 