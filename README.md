<h1 align="center"> 📖 Florence </h1>

<div align="center">
  
  [![GitHub contributors](https://img.shields.io/github/contributors/fuboki10/florence)](https://github.com/fuboki10/florence/contributors)
  [![GitHub issues](https://img.shields.io/github/issues/fuboki10/florence)](https://github.com/fuboki10/florence/issues)
  [![GitHub forks](https://img.shields.io/github/forks/fuboki10/florence)](https://github.com/fuboki10/florence/network)
  [![GitHub stars](https://img.shields.io/github/stars/fuboki10/florence)](https://github.com/fuboki10/florence/stargazers)
  [![GitHub license](https://img.shields.io/github/license/fuboki10/florence)](https://github.com/fuboki10/florence/blob/main/LICENSE)
  <img src="https://img.shields.io/github/languages/count/fuboki10/florence" />
  <img src="https://img.shields.io/github/languages/top/fuboki10/florence" />
  <img src="https://img.shields.io/github/languages/code-size/fuboki10/florence" />
  <img src="https://img.shields.io/github/issues-pr-raw/fuboki10/florence" />

</div>

## Table of Contents

- [Table of Contents](#table-of-contents)
- [About The Project](#about-the-project)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Installation](#installation)
  - [Environmental Variables](#environmental-variables)
  - [Running](#running)
  - [Database](#database)
- [Testing](#testing)
  - [Running Unit Tests](#running-unit-tests)
- [API Documentation](#api-documentation)
- [Functional Documentation](#functional-documentation)
- [Screenshots](#screenshots)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Contributers](#contributers)

## About The Project

Online Education website to mimic websites like Coursera and Udemy
<br> <br>
<a href="https://florenceapi.herokuapp.com/">FLORENCE API</a>
<br>
<a href="https://github.com/aaarafat/machine/">FLORENCE FRONTEND</a>

### Built With

- [Node.js](https://nodejs.org)
- [TypeScript](https://www.typescriptlang.org)
- [Nest](https://nestjs.com/)
- [Jest](https://jestjs.io)
- [PostgreSQL](https://www.postgresql.org)
- [Knex](http://knexjs.org)

<!-- GETTING STARTED -->

## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Installation

1. Clone the repo

```sh
git clone https://github.com/fuboki10/florence.git
```

2. Install dependencies (it will create the database automatically)

```sh
npm install
```

### Environmental Variables

For developers, you can directly use our `.development.env` or modify it if you like.

For production, you need to make your own `.production.env` with the following structure.

```
JWT_EXPIRE_SECONDS=6000000000000000
JWT_SECRET=SECRET

DB_HOST=host
DB_USER=user
DB_NAME=name
DB_PASS=pass
```

### Running

1. Running on development

```sh
npm run start:dev
```

2. Running on production

Upon creating `.production.env` like in [Environmental Variables](#environmental-variables) section. run this script:

```sh
npm run build
npm start
```

### Database

1. Migration

```sh
npm run db:migrate
```

2. Seeds

```sh
npm run seed
```

3. Roll back migration

```sh
npm run db:migrate-revert
```

4. Create Database

```sh
npm run db:create
```

<!-- TESTING -->

## Testing

The tests can be found in `tests`, and each controller has its own test file in `tests\unit\controller`. Mongoose models tests are also found in `tests\unit\models` as well as middleware which is located at `tests\unit\middlewares`.

### Running Unit Tests

run the following script:

```sh
npm test
```

<!-- API DOC -->

## API Documentation

https://florenceapi.herokuapp.com/docs/

<!-- FUNC DOC -->

## Functional Documentation

install the latest version on npm globally (might require `sudo` if you are on linux):

```sh
npm install -g jsdoc
```

in order to generate the documentation, run the `jsdoc` command:

```sh
jsdoc -r ./src
```

By default, the generated documentation is saved in a directory named `out`. You
can use the `--destination` (`-d`) option to specify another directory.

## Screenshots
![image](https://user-images.githubusercontent.com/35429211/180889474-ad00d561-3221-400c-95f6-5eb33d637789.png)
![image](https://user-images.githubusercontent.com/35429211/180892439-8ce108aa-cda9-44f6-be5a-c302e61d05e8.png)


## Roadmap

See the [open issues](https://github.com/fuboki10/florence/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b AmazingFeature-Feat`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin AmazingFeature-Feat`)
5. Open a Pull Request

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- Contributers -->

## Contributers

<table>
  <tr>
    <td align="center"><a href="https://github.com/fuboki10"><img src="https://avatars.githubusercontent.com/u/35429211?s=460&v=4" width="100px;" alt=""/><br /><sub><b>Abdelrahman Tarek</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/D4rk1n"><img src="https://avatars.githubusercontent.com/u/44725090?s=460&v=4" width="100px;" alt=""/><br /><sub><b>Abdelrahman Arafat</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/Hassan950"><img src="https://avatars.githubusercontent.com/u/42610032?s=460&v=4" width="100px;" alt=""/><br /><sub><b>Hassan Mohamed</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/lido22"><img src="https://avatars.githubusercontent.com/u/42592954?v=4" width="100px;" alt=""/><br /><sub><b>Ahmed Walid</b></sub></a><br /></td>
  </tr>
 </table>
