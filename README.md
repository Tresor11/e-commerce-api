# Resell-App API

> This project is an Api for a [React-app](https://resell-app.netlify.app/).

This API is made of three models:
- User model
- Item model
- Favorite model

The API has the following endpoints:

`POST /auth/login`

allow user to authenticate and return a token

`POST /signup`

allows user to create an account

`GET /profile`

returns the user information

`POST /profile`

allows user to edit their profile

`GET /items`

returns all the items

`POST /items`

allows admin to create an item

`GET /items/id`

returns a specific item

`PUT /items/id`

allows admin to edit an item

`DELETE /items/id`

allows admin to delete an item

## Built With

- Rails
- Ruby 
- Heroku

## Getting Started

Here are the steps to follow in order to get this project on your local computer.

### Prerequisites

`rails v6.0.3 +`

`ruby v2.7.1 +`

### Setup

clone this repo by typing `git clone https://github.com/Tresor11/final-capstone-api.git`

### Install

install the dependencies by typing `bundle install`

### Usage

start the local server by running `rails s`

### Testing

run the tests by typing `bundle exec rspec`

### Deployment

this project is deployed on heroku

## Author

👤 **Tresor bireke**

- Github: [@Tresor11](https://github.com/Tresor11)
- Twitter: [@Tbireke](https://twitter.com/Tbireke)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used

## 📝 License

This project is [MIT](lic.url) licensed.

