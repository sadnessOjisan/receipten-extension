@bs.val external alert: string => unit = "alert"

type window
@bs.val external window: window = "window"
@bs.set external setOnload: (window, @bs.this ((window) => unit)) => unit = "onload"
setOnload(window, @bs.this ((_) => {
     alert("aa")
     alert("bb")
}))


@bs.val @bs.scope(("window", "document"))
external getElementById: string => unit = "getElementById"

