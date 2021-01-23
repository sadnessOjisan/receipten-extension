const HtmlWebpackPlugin = require("html-webpack-plugin");
const path = require("path");

module.exports = {
  mode: process.env.NODE_ENV,
  entry: {
    background: "./src/background/Background.bs.js",
    content: "./src/content/Content.bs.js",
    popup: "./src/popup/Popup.bs.js",
  },
  output: {
    filename: "[name].bundle.js",
    path: __dirname + "/dist",
  },
  devtool: "inline-source-map",
  target: ["web", "es5"],
};
