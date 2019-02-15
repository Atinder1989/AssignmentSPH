//
//  MobileDataUsageViewController.swift
//  Assignment
//
//  Created by Atinderpal Singh on 05/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import UIKit

class MobileDataUsageViewController: UIViewController {
    @IBOutlet weak var mobileDataCollectionView: UICollectionView!

    private let mobileDataUsageViewModel = MobileDataUsageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set CollectionView Custom Setting
        self.setCollectionViewCustomSetting()
        
        // Add Listener From ViewModel
        self.listenToModalClosures()
        
        // Fetch Data From Server
        mobileDataUsageViewModel.getMobileDataUsageInformation()
    }
}


// MARK:- Private Methods
extension MobileDataUsageViewController {
    private func setCollectionViewCustomSetting() {
        self.mobileDataCollectionView.register(MobileDataUsageCell.nib, forCellWithReuseIdentifier: MobileDataUsageCell.identifier)
        self.mobileDataCollectionView.delegate = mobileDataUsageViewModel
        self.mobileDataCollectionView.dataSource = mobileDataUsageViewModel
    }
    
    private func listenToModalClosures() {
        mobileDataUsageViewModel.reloadDataClosure = { [weak self] in
            DispatchQueue.main.async {
                if let this = self {
                    this.mobileDataCollectionView.reloadData()
                }
            }
        }
    }
    
}
