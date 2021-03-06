%%raw(`
let items = [];

const ENDPOINT_HOST = "https://receipten-backend.vercel.app";

const endpointUrls = {
  postItems: ENDPOINT_HOST + "/api/save-items",
};

chrome.storage.local.set({ data: [] });

chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  switch (request.method) {
    case "saveItem": // 保存されているデータ数を取得
      const value = request.value;

      items.push(value);
      chrome.storage.local.set({ data: items }, function () {});
      sendResponse("saveItem", request);
      break;
    case "postRequest": // 保存されているデータ数を取得
      fetch(endpointUrls.postItems, {
        method: "post",
        body: JSON.stringify(request.value),
        headers: { "Content-Type": "application/json" },
      })
        .then((response) => response.json())
        .then((data) => {
          sendResponse(data.id);
          chrome.runtime.sendMessage(
            { method: "getId", value: data.id },
            function (id) {}
          );
        })
        .catch((e) => {
          sendResponse(e.message);
        });
      return true;
    default:
      console.log("no method");
      break;
  }
});

const getData = () => {
  return items;
};

console.log("load background");

function backgroundFunction() {
  return "hello from the background!";
}

`)