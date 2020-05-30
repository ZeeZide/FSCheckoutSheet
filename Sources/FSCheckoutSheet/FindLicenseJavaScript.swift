//
//  FindLicenseJavaScript.swift
//  
//
//  Created by Helge Heß on 30.05.20.
//

internal let FindLicenseJavaScript =
"""
document.addEventListener("readystatechange", function() {
  function zzFindLicenses() {
    let licenses = [];
    try {
      const viewData = JSON.parse(document.getElementById("viewdata").innerHTML);
      viewData.order.groups.forEach(function(group) {
        group.items.forEach(function(item) {
          const sku = item["sku"];
          Object.values(item.fulfillments).forEach(function(fulfillments) {
            fulfillments.forEach(function(license) {
              license["sku"] = sku;
              licenses.push(license);
            });
          });
        });
      });
    }
    catch(err) {
      console.log("did not find license");
    }
    return licenses;
  }
  if (document.readyState == "complete") {
    const licenses = zzFindLicenses();
    console.log("found licenses:", licenses);
    window.webkit.messageHandlers.zz.postMessage(licenses);
  }
});
"""
