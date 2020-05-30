//
//  CheckoutPageHTML.swift
//
//  Created by Helge Heß on 30.05.20.
//

import struct Foundation.URL

fileprivate let FSBuilderVersion = "0.8.3"
fileprivate let FastSpringBuilderURL =
  URL(string: "https://d1f8f9xcsvx3ha.cloudfront.net/sbl/"
            + FSBuilderVersion
            + "/fastspring-builder.min.js")!

/**
 * Generate the HTML for the FastSpring checkout page.
 *
 * The product and the quantity is preconfigured for checkout.
 *
 * Note: Arguments are not escaped in any way.
 *
 * - Parameter storeFront: The name of the storefront, e.g. "zeezide.onfastspring.com"
 * - Parameter productPath: The (internal) name of the product, e.g. "soy-for-community-slacks"
 * - Parameter quantity: The product quantity to preconfigure (defaults to 1)
 * - Returns: The HTML for the checkout page, to be set in the WKWebView
 */
internal func CheckoutPageHTML(for storeFront : String,
                               productPath    : String,
                               quantity       : Int = 1) -> String
{
  let builderJS = FastSpringBuilderURL.absoluteString
  
  return
    """
    <html><head><title>FastSpring Checkout</title></head>
      <body>
        <script id='fsc-api' type='text/javascript'
                src='\(builderJS)'
                data-storefront='\(storeFront)'></script>
        <script>
          const s = { 'reset': true, 'checkout' : true,
                      'products': [
                        { 'path': '\(productPath)', 'quantity': \(quantity) }
                      ] };
          fastspring.builder.push(s);
        </script>
      </body>
    </html>
    """
}
