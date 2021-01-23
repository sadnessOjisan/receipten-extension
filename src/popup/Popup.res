// open Chrome

// @bs.val external alert: string => unit = "alert"

// @bs.val @bs.scope(("window", "document"))
// external getElementById: string => Dom.element = "getElementById"

// type window
// @bs.val external window: window = "window"
// @bs.set external setOnload: (window, @bs.this ((window) => unit)) => unit = "onload"
// setOnload(window, @bs.this ((_) => {
//      let el = getElementById("root")

// getMany(["data"], (v)=>{
    
// })
        
// }))

%%raw(`
window.onload = function () {
  const el = document.getElementById("tabnum");
  chrome.storage.local.get(["data"], function (value) {
    const data = value.data;
    data.forEach((d) => {
      const p = document.createElement("li");
      p.innerHTML = "<span>"  + d.itemName + "</span><span>" +d.itemPrice + "</span>";
      el.appendChild(p);
    });
  });

  const createReceiptButtonEl = document.getElementById("create-receipt");
  createReceiptButtonEl.addEventListener("click", () => {
    chrome.storage.local.get(["data"], function (value) {
      const data = value.data;
      chrome.runtime.sendMessage(
        { method: "postRequest", value: data },
        function (id) {
          window.location.href = "https://" + id;
        }
      );
    });
  });
};

`)