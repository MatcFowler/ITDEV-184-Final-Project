//
//  CookBookHeaderView.swift
//  CookEZ
//
//  Created by Admin on 4/11/24.
//

import UIKit

class CookBookHeaderView : UIView {
    
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        override var intrinsicContentSize: CGSize {
            return CGSize(width: UIView.noIntrinsicMetric, height: 60)
        }
        
        private func commonInit() {
            let bundle = Bundle(for: CookBookHeaderView.self)
            bundle.loadNibNamed("CookBookHeaderViewNib", owner: self, options: nil)
            addSubview(contentView)
            contentView.backgroundColor = appColorForeGround
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
        }
    
}
