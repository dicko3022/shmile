expect = require("chai").expect
rewire = require "rewire"
ImageTwiddler = rewire "../lib/image_twiddler"
EventEmitter = require("events").EventEmitter
sinon = require "sinon"

fakeExec = (command, cb) ->

fakeImageMagick = {
  convert: (convertArgs, cb) ->
    cb()
}

describe "ImageTwiddler", ->
  beforeEach ->
    ImageTwiddler.__set__("im", fakeImageMagick)
    ImageTwiddler.__set__("exec", fakeExec)
  describe "#constructor", ->
    it "returns instance of ImageTwiddler", ->
      cc = new ImageTwiddler()
      expect(cc).to.be.instanceof(ImageTwiddler)

  describe "#init", ->
    it "returns EventEmitter", ->
      ee = new ImageTwiddler().init()
      expect(ee).to.be.instanceof(EventEmitter)

  describe "events", ->
    describe "on 'composite'", ->
      xit "emits 'laid_out' when done with step one", ->
        @it = new ImageTwiddler().init()

        spy = sinon.spy()
        @it.on("laid_out", spy)
        @it.emit "composite"

        expect(spy.called).to.be.true
