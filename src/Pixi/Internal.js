"use strict";

// module Pixi.Internal


exports.newPixi0 = function newPixi0(objName) {
  return function() {
    return new PIXI[objName]();
  };
};


exports.newPixi1Impl = function newPixi1Impl(objName, arg1) {
  return function() {
    return new PIXI[objName](arg1);
  };
};


exports.newPixi2Impl = function newPixi2Impl(objName, arg1, arg2) {
  return function() {
    return new PIXI[objName](arg1, arg2);
  };
};

