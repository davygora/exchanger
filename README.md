# exchanger
#### How to run:
```sh
  $ git clone git@github.com:davygora/exchanger.git
  $ cd exchanger
  $ bunlde install
  $ ruby app.rb
```
#### How to use:
```sh
>>Exchanger.exchange(100, '2016-10-26')
=>109.25

or 

>>Exchanger.exchange(100, [Date.yesterday, Date.today])
=> [105.47999999999999, 107.65]

>>Exchanger.exchange(100, [Date.yesterday, Date.today-10.day]
=> [105.47999999999999, 106.14]

>>Exchanger.exchange(100, [Date.yesterday, '2016-10-26', Date.today - 10.day])
=>[105.47999999999999, 109.25, 107.65]
```
#### How to run tests:
```sh
  $ ruby app_test.rb
```
