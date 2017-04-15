//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Ehab Amer on 4/12/17.
//  Copyright © 2017 yara mohamediCode. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

	@IBOutlet var webView : UIWebView!
	
	@IBAction func backPressed(_ sender: UIButton) {
		
		dismiss(animated: true, completion: nil)
	}
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
			if let htmlData = try? Data(contentsOf: url) {
				let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
				
				let htmlString = String(data: htmlData, encoding: String.Encoding.utf8)!
				
//				webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
				
				webView.loadHTMLString(htmlString, baseURL: nil)
				
			}
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
