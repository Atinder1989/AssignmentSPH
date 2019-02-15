//
//  MobileDataUsageViewModel.swift
//  Assignment
//
//  Created by Atinderpal Singh on 05/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import Foundation
import UIKit

class MobileDataUsageViewModel: NSObject {
    var reloadDataClosure: (() -> Void)? = nil
    private var mobileDataInfo: [MobileDataInfo] = [] {
        didSet {
            if let reload = reloadDataClosure {
                reload()
            }
        }
    }
}

// MARK:- Public Methods
extension MobileDataUsageViewModel{
    // MARK: Get Mobile Data Usage Information
    func getMobileDataUsageInformation() {
        var service = Service.init(httpMethod: WebserviceHTTPMethod.GET)
        service.url = ServiceHelper.getDataStoreSearchUrl()
        ServiceManager.processDataFromServer(service: service, model: MobileDataUsageResponse.self) { (responseVo, error) in
            
            if error != nil {
                self.mobileDataInfo = []
                return
            }
            
            if let response = responseVo {
                self.getVolumeDataInfoList(responseVo: response)
            } else {
                self.mobileDataInfo = []
            }
        }
    }
}

// MARK:- Private Methods
extension MobileDataUsageViewModel{
    // MARK: Get Volume Data List
    private func getVolumeDataInfoList(responseVo:MobileDataUsageResponse) {
        let startYear = 2008
        let endYear = 2018
        
        var dataInfoList = [MobileDataInfo]()
        for year in startYear...endYear {
            var array = [MobileDataRecords]()
            let _ = responseVo.records.map { (record)  in
                if record.quarter.contains("\(year)") {
                    array.append(record)
                }
            }
            var volumeInfo:MobileDataInfo?
            let _ = array.map { (record) in
                if volumeInfo == nil {
                    volumeInfo = MobileDataInfo(year: "\(year)", quarters: [Float(record.volume_of_mobile_data) ?? 0])
                } else {
                    if let info = volumeInfo {
                        var dataInfo = info
                        dataInfo.quarters = dataInfo.quarters
                            + [Float(record.volume_of_mobile_data) ?? 0]
                        volumeInfo = dataInfo
                    }
                }
            }
            if let info = volumeInfo {
                dataInfoList.append(info)
            }
        }
        self.mobileDataInfo = dataInfoList
    }
}
// MARK:-  CollectionView Delegate And Datasource Methods
extension MobileDataUsageViewModel: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.mobileDataInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (UIScreen.main.bounds.width / 2)
        let height =  UIScreen.main.bounds.height / 5
        return CGSize.init(width: width , height: CGFloat(height))
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MobileDataUsageCell = collectionView.dequeueReusableCell(withReuseIdentifier: MobileDataUsageCell.identifier, for: indexPath) as! MobileDataUsageCell
        cell.configureCell(delegate: self, info: self.mobileDataInfo[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}
// MARK:-  CollectionView Delegate And Datasource Methods
extension MobileDataUsageViewModel: MobileDataUsageCellDelegate{
    func didTapOnImageView() {
        
    }
}
