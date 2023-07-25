FIUBAWallet: REST API
========
# EN
REST API meant to interact with the [FIUBAWallet Telegram Bot](https://github.com/MateoCraviotto/FIUBAWalletBot).

Project for the Software Engineering II course in FIUBA. It consists in a virtual wallet with basic transactions such as virtual currency transfer and expense sharing. The whole project was done in three weeks using Xtreme Programming (Agile Methodology), getting the requirements from a Product Owner and developing the features using Test-Driven Development (TDD) in one week sprints.

Project based on:
* Sinatra, web framework for Ruby
* Sequel for data access with the Repository pattern
* PostgreSQL
* The Hexagonal Architecture pattern

It also contains:
* Gherkin/Cucumber acceptance tests
* Rspec unit tests
* SimpleCov to measure test coverage
* Rubocop for code styling
* Rake for task automation

## Collaborators
- Mateo Craviotto
- Juan Cruz Roussilian
- Gabriel Belletti

## Setup

Install dependencies:

    bundle install

Run the tests (cucumber + rspec) and linter (rubocop):

    bundle exec rake    

Run the app (runs migrations + webapp):    

    ./start_app.sh

---
# ES
REST API para interactuar con el [FIUBAWallet Telegram Bot](https://github.com/MateoCraviotto/FIUBAWalletBot).

Proyecto para la materia 95.21 Métodos y Modelos de la Ingeniería de Software 2, FIUBA. Consiste en una billetera virtual con características simples como transacciones en moneda virtual entre usuarios, además de la posibilidad de compartir gastos, entre otras. El proyecto en su totalidad fue realizado en tres semanas usando la metodología Xtreme Programming, donde se obtenían los requerimientos del Product Owner y se desarrollaba en sprints de una semana usando Test-Driven Development (TDD).

Este proyecto está basado en:

* Sinatra (micro framework web de Ruby)
* Sequel (componente de acceso datos usando patrón Repository)
* PostgreSQL (base de datos relacional)
* Patrón de Arquitectura Hexagonal

Por otro lado a nivel desarrollo tiene:

* Pruebas con Gherkin/Cucumber
* Pruebas con Rspec
* Medición de cobertura con SimpleCov
* Verificación de estilos con Rubocop
* Automatización de tareas de Rake

## Integrantes
- Gabriel Belletti
- Mateo Craviotto
- Juan Cruz Roussilian

## Setup

Inicialmente hay que instalar las dependencias:

    bundle install

Luego para ejecutar test (cucumber + rspec) y linter (rubocop):

    bundle exec rake    

Finalmente para ejecutar la aplicación (ejecución de migrations y web):    

    ./start_app.sh

