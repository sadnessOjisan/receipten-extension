// open Chrome

// @bs.val external alert: string => unit = "alert"

type item = {
    itemPrice: string,
    itemName: string
}

type dataType = {
    data: array<item>
}

@bs.set external setHTML: (Dom.element, (string)) => unit = "innerHTML"

@bs.val @bs.scope(("window", "document"))
external getElementById: string => Dom.element = "getElementById"

@bs.val @bs.scope(("window", "document"))
external createElement: string => Dom.element = "createElement"


@bs.send
external appendChild: (Dom.element, Dom.element) => unit = "appendChild"

@bs.val @bs.scope(("chrome", "storage", "local"))
external get: string => ((dataType)=>())  => () = "get"

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
     })
)

// %%raw(`
// window.onload = function () {
//   const el = document.getElementById("tabnum");
//   chrome.storage.local.get(["data"], function (value) {
//     const data = value.data;
//     data.forEach((d) => {
//       const p = document.createElement("li");
//       p.innerHTML = "<span>"  + d.itemName + "</span><span>" +d.itemPrice + "</span>";
//       el.appendChild(p);
//     });
//   });

//   const createReceiptButtonEl = document.getElementById("create-receipt");
//   createReceiptButtonEl.addEventListener("click", () => {
//     chrome.storage.local.get(["data"], function (value) {
//       const data = value.data;
//       chrome.runtime.sendMessage(
//         { method: "postRequest", value: data },
//         function (id) {
//             window.open("https://" + id, "google");
//         }
//       );
//     });
//   });
// };

// `)