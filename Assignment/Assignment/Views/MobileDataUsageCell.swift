//
//  MobileDataUsageCell.swift
//  Assignment
//
//  Created by Atinderpal Singh on 05/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import UIKit

protocol MobileDataUsageCellDelegate {
    func didTapOnImageView()
}

class MobileDataUsageCell: UICollectionViewCell {
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var dataConsumptionLabel: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var volumeDecreaseImageView: UIImageView!
    
    private var delegate:MobileDataUsageCellDelegate?
    private var mobileDataInfo:MobileDataInfo!
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.viewBackground.layer.cornerRadius = 5
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        tap.numberOfTapsRequired = 1
        volumeDecreaseImageView.addGestureRecognizer(tap)
    }
    
    // MARK: Configure Cell
    func configureCell(delegate:MobileDataUsageCellDelegate,info:MobileDataInfo) {
        self.delegate = delegate
        self.mobileDataInfo = info
        self.yearLabel.attributedText = self.getAttributedText(keyString: "Year: ", valueString: info.year)
        self.dataConsumptionLabel.attributedText = self.getAttributedText(keyString: "Data Usage: ", valueString: "\(info.getTotalDataConsumption())")
        self.volumeDecreaseImageView.image = info.isVolumeDataDecrease() ? UIImage.init(named: "volumeDecrease") : UIImage.init(named: "volumeIncrease")
    }
    // MARK: Get Attributed Text Method
    private func getAttributedText(keyString:String,valueString:String) -> NSMutableAttributedString {
        let key = NSMutableAttributedString(string: keyString)
        key.addAttributes([NSAttributedString.Key.font: UIFont(name:AppFont.HelviticaBold.rawValue, size: 19.0)! ,NSAttributedString.Key.foregroundColor: UIColor.red], range: NSMakeRange(0, key.length))
        let value = NSMutableAttributedString(string: valueString)
        value.addAttributes([NSAttributedString.Key.font:UIFont(name:AppFont.HelviticaRegular.rawValue, size: 16)!,NSAttributedString.Key.foregroundColor: UIColor.white], range: NSMakeRange(0, value.length))
        let final:NSMutableAttributedString = key
        final.append(value)
        return final
    }
    // MARK: Get Attributed Text Method

    @objc private func handleTap(sender: UITapGestureRecognizer? = nil) {
        if self.mobileDataInfo.isVolumeDataDecrease() {
            if let delegate = self.delegate {
                delegate.didTapOnImageView()
            }
        }
    }

}
