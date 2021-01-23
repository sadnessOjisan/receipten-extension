module Local= {
    [@bs.scope ("chrome", "storage", "local")] [@bs.val]
    external get : (string, [@bs] (Js.Dict.t(Js.Json.t) => unit)) => unit =
      "";
    let get: (string, Js.Dict.t(Js.Json.tagged_t) => unit) => unit =
      (str, f) =>
        get(str, [@bs] ((dict) => f(Js.Dict.map([@bs] ((v) => Js.Json.classify(v)), dict))));
    [@bs.scope ("chrome", "storage", "local")] [@bs.val]
    external getMany : (array(string), [@bs] (Js.Dict.t(Js.Json.t) => unit)) => unit =
      "get";
    let getMany: (array(string), Js.Dict.t(Js.Json.tagged_t) => unit) => unit =
      (arr, f) =>
        getMany(arr, [@bs] ((dict) => f(Js.Dict.map([@bs] ((v) => Js.Json.classify(v)), dict))));
    [@bs.scope ("chrome", "storage", "local")] [@bs.val]
    external set : (Js.Dict.t(Js.Json.t), unit => unit) => unit =
      "";
  };