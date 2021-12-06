//
//  DetailsVC.swift
//  Deneme
//
//  Created by SEVVAL on 6.12.2021.
//

import UIKit
import Alamofire
import WebKit

class DetailsVC: UIViewController {

    @IBOutlet weak var baslikLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    var viewModel: DetailsVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.secilenData.baslik
        webView.loadHTMLString(viewModel.secilenData.icerik, baseURL: nil)
        
    }
    


}

/*
 V(Details VC) <-> VM(Details VM) <-> M (Tekli data)
 
 MVVM
 */
