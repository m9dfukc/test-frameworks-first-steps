app       = require '../app'
chai      = require 'chai'
request   = require 'supertest'
expect    = chai.expect
should    = chai.should()

describe 'first test procedure', ->
  request = request(app)
  describe 'GET /delay', ->
    it 'should respond 200ms delayed', (done) ->
      request
        .get('/delay')
        .expect('Content-Type', /text/)
        .expect(200)
        .expect('hello world delayed')
        .end (err, res) ->
          res.text.length.should.equal 19
          done err, res
  describe 'GET /', ->
    it 'should respond', (done) ->
      request
        .get('/')
        .expect('Content-Type', /text/)
        .expect('hello world')
        .expect(200, done)
