%%raw(`
var element = document.querySelectorAll('[aria-label="Price"]');

document.addEventListener(
  "click",
  function (e) {
    const text = e.target.innerText;
    const textArr = text.split("\n");
    if (!isClickedItem(textArr)) return;
    const itemName = textArr[0];
    const itemPrice = textArr[textArr.length - 1];
    console.log(itemName, itemPrice);
    chrome.runtime.sendMessage(
      { method: "saveItem", value: { itemName, itemPrice } },
      function (response) {
        console.log("response", response);
      }
    );
    e.preventDefault();
  },
  false
);

/**
 *
 * @param {Array<string>} textArr クリックされた要素を改行でセパレートした配列
 */
const isClickedItem = (textArr) => {
  if (textArr.length > 4) return false;
  const lastText = textArr[textArr.length - 1];
  if (!lastText.includes("¥")) return false;
  return true;
};

chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
  console.log(request);
  switch (request.method) {
    case "getId":
  }
});

`)