// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "../../node_modules/bs-platform/lib/es6/curry.js";
import * as Js_dict from "../../node_modules/bs-platform/lib/es6/js_dict.js";
import * as Js_json from "../../node_modules/bs-platform/lib/es6/js_json.js";

function get(str, f) {
  chrome.storage.local.get(str, (function (dict) {
          return Curry._1(f, Js_dict.map(Js_json.classify, dict));
        }));
  
}

function getMany(arr, f) {
  chrome.storage.local.get(arr, (function (dict) {
          return Curry._1(f, Js_dict.map(Js_json.classify, dict));
        }));
  
}

export {
  get ,
  getMany ,
  
}
/* No side effect */
