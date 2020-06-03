# Toy Robot Simulator

* Application is a simulation of robot moving on square board.
* Program accepts series of defined commands according to which robot is moving.

## Available commands

Available commands are `PLACE X,Y,FACE`, `MOVE`, `LEFT`, `RIGHT`, `REPORT`.

* `PLACE X,Y,FACE` defines first placement of robot and direction it is facing (NORTH, SOUTH, EAST, WEST).
* `MOVE` tell robot to move forward in direction it is facing.
* `LEFT` and `RIGHT` turns robot in specified direction without changing it's position.
* `REPORT` will announce position of robot and direction it is facing.

Robot cannot fall of the board so it will ignore every command leading to this.

Example of valid commands string:
```ruby
PLACE 0,0,NORTH MOVE RIGHT MOVE MOVE RIGHT MOVE REPORT
```
It will place robot in lower left corner of board, move it and final position is 2,0,SOUTH.

## Usage

Application is using rvm (ruby-2.4.1)

* Clone this repo:

```ruby
git clone git@github.com:szymoniwacz/toy-robot.git
```

Go to app folder

* Install bundler gem:

```ruby
gem install bundler
```

* Run application:

```ruby
ruby lib/toy_robot_simulator.rb
```

* Run tests:

```ruby
bundle exec rspec
```

* To excercise robot run:

```ruby
bundle exec rake exercise_robot
```

## Improvements

Application is ready to be easily improved.
For example:
* Surface is a matrix and can take any dimensions.
* There can be any number of obstacles on the table (like rocks, holes etc.).
* Surface can be used by any number of robots at this same time.
* This application can be a start to develop a simple game.
* It is possible to add more commands and implement new behavior of robot.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
