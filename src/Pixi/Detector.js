"use strict";

// module Pixi.Detector


exports.autoDetectRendererImpl = function autoDetectRendererImpl(x, y) {
  return function() {
    return PIXI.autoDetectRenderer(x, y);
  };
};


exports.appendToBody = function appendToBody(x) {
  return function() {
    document.body.appendChild(x);
  };
}
