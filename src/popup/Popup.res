open Chrome

@bs.val external alert: string => unit = "alert"

@bs.val @bs.scope(("window", "document"))
external getElementById: string => Dom.element = "getElementById"

type window
@bs.val external window: window = "window"
@bs.set external setOnload: (window, @bs.this ((window) => unit)) => unit = "onload"
setOnload(window, @bs.this ((_) => {
     let el = getElementById("root")

getMany(["data"], (v)=>{
     Js.log(v.data)
})
        
}))

