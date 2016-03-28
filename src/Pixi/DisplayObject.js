"use strict";


// module Pixi.DisplayObject


exports.setPositionImpl = function setPositionImpl(_) {
  return function(a) {
    return function(p) {
      return function() {
        a.position = p;
        return a;
      };
    };
  };
};
