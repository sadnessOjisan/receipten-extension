type item = {
    itemPrice: string,
    itemName: string
}

type dataType = {
    data: array<item>
}

type msg = {
    method: string, value: array<item>
}

@bs.set external setHTML: (Dom.element, (string)) => unit = "innerHTML"

@bs.val @bs.scope(("window", "document"))
external getElementById: string => Dom.element = "getElementById"

@bs.val @bs.scope(("window"))
external newTab: string => unit = "open"

@bs.val @bs.scope(("window", "document"))
external createElement: string => Dom.element = "createElement"

@bs.send
external appendChild: (Dom.element, Dom.element) => unit = "appendChild"

@bs.send
external addEventListener: (Dom.element, string, ()=>()) => unit = "addEventListener"

@bs.val @bs.scope(("chrome", "storage", "local"))
external get: string => ((dataType)=>())  => () = "get"

@bs.val @bs.scope(("chrome", "runtime"))
external sendMessage: msg => ((string)=>())  => () = "sendMessage"

type window
@bs.val external window: window = "window"
@bs.set external setOnload: (window, @bs.this ((window) => unit)) => unit = "onload"

setOnload(window, @bs.this ((_) => {
     let el = getElementById("root")
     get("data", (value)=>{
         Js.log(value.data)
         let data = value.data;
         Belt.Array.forEach(data, d => {
             let list = createElement("li")
             setHTML(list, d.itemName)
             Js.log(el)
             Js.log(list)
             appendChild(el, list)
         })});

         let btn = getElementById("create-receipt")
         Js.log(btn)
         addEventListener(btn, "click", ()=>{
             get("data", (value)=>{
         let data = value.data;
         sendMessage(
             {method: "postRequest", value: data}, (id)=>{
             newTab("https://receipten.web.app/#/item/" ++ id)
         })
         })})

     })
)