//
//  WifiDataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 11/2/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


fileprivate struct WifiSection {
    let items: [WifiCommand]
    let itemsPerRow: Int
}

protocol WifiDataSourceDelegate {
    func commandTapped(command: WifiCommand)
}

class WifiDataSource: NSObject {
    
    fileprivate let sections: [WifiSection] = {
        let power = WifiSection(items: [.on, .off], itemsPerRow: 2)
        let colors = WifiSection(items: [.color(Style.Color.red.color(), true)], itemsPerRow: 4)
        return [power, colors]
    }()
    
    var delegate: WifiDataSourceDelegate?
    fileprivate var collectionViewRef: UICollectionView?
    
    init(delegate: WifiDataSourceDelegate? = nil) {
        self.delegate = delegate
        super.init()
    }
}


//MARK: - Custom Methods

extension WifiDataSource {
    
    func register(collectionView: UICollectionView) {
        self.collectionViewRef = collectionView
        collectionView.register(WifiButtonCell.self, forCellWithReuseIdentifier: WifiButtonCell.reuseIdentifier)
    }
    
    func lastIndexPath() -> IndexPath {
        let section = sections.count-1
        let item = sections[section].items.count-1
        return IndexPath(item: item, section: section)
    }
}


//MARK: - UICollectionView DataSource

extension WifiDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WifiButtonCell.reuseIdentifier, for: indexPath) as! WifiButtonCell
        let command = sections[indexPath.section].items[indexPath.item]
        cell.updateUI(command: command)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
}

//MARK: - UICollectionViewDelegate

extension WifiDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let command = sections[indexPath.section].items[indexPath.item]
        delegate?.commandTapped(command: command)
    }
    
}


//MARK: - UICollectionView FlowLayout Delegate

extension WifiDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = sections[indexPath.section]
        let size = CGSize(width: collectionView.bounds.width / CGFloat(section.itemsPerRow), height: 50)
        return size
    }
}



//MARK: - Data Model

extension WifiCommand {
    
    func title() -> String {
        switch self {
        case .on:
            return "On"
        case .off:
            return "Off"
        case .color(let color, let persist):
            return "\(color.description) \(persist)"
        }
    }
    
    func textColor() -> UIColor {
        switch self {
        case .on:
            return Style.Color.white.color()
        case .off:
            return Style.Color.white.color()
        case .color(let color, _):
            return color
        }
    }
}








//MARK: - Cell

class WifiButtonCell: UICollectionViewCell {
    static let reuseIdentifier = "WifiButtonCell"
    
    fileprivate var command: WifiCommand?
    fileprivate lazy var label: UILabel = {
        let label = UILabel()
        label.font = Style.Font.bold.standard()
        label.backgroundColor = Style.Color.darkGray.color()
        return label
    }()
    
    override var isHighlighted: Bool {
        didSet {
            let color = isHighlighted ? command?.textColor().darken(byPercentage: 0.3) : command?.textColor()
            label.textColor = color
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
            
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


extension WifiButtonCell {
    
    func updateUI(command: WifiCommand) {
        self.command = command
        label.text = command.title()
        label.textColor = command.textColor()
    }

}














