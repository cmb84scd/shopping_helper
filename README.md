[![Codeship Status for cmb84scd/shopping_helper](https://app.codeship.com/projects/8e7d43d9-779f-4697-9381-592be0620b21/status?branch=master)](https://app.codeship.com/projects/422370)
# Shopping Helper

Only buy an item only occasionally but struggle to remember what aisle it's in? Your supermarket likes to move items round from time to time? Then this app will help make your grocery shopping a little easier.

After each iteration I am writing a Wiki to help keep track of my progress and so you can see how I built this app up. Here are the links to the iterations in my Wiki:<br>
<b>[First Iteration](https://github.com/cmb84scd/shopping_helper/wiki/First-Iteration)<br>
[Second Iteration](https://github.com/cmb84scd/shopping_helper/wiki/Second-Iteration)<br>
[Third Iteration](https://github.com/cmb84scd/shopping_helper/wiki/Third-Iteration)<br>
[Fourth Iteration](https://github.com/cmb84scd/shopping_helper/wiki/Fourth-Iteration)<br>
[Fifth Iteration](https://github.com/cmb84scd/shopping_helper/wiki/Fifth-Iteration)</b>

## App deployment
- I have used Codeship CI
- To merge a PR, first Codeship must pass
- I have deployed the app using Heroku and it will only deploy when Codeship is passing
- Visit [Shopping Helper](https://shopping-help.herokuapp.com/)

## How to use
Clone this repository and then run the following:
```
bundle install
bin/rails db:create
bin/rails db:migrate
```
To run the tests do:
```
rspec
```
to see that it's linted, do:
```
rubocop
```
and to run the app locally do:
```
bin/rails server
visit localhost:3000 in your browser
```
## User Stories
You will find these [here](https://github.com/cmb84scd/shopping_helper/wiki/User-Stories) in my Wiki.

## Entity Relationship Diagram
### Relationships
```
User has many products
Product belongs to user
```
![e_r_diagram1](https://user-images.githubusercontent.com/61843502/103560579-e4373a00-4eaf-11eb-9a88-e610099776b2.png)
