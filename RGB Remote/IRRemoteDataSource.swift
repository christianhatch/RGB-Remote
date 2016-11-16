//
//  RGBDataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 11/2/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


protocol IRRemoteCollectionViewDataSource: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func lastIndexPath() -> IndexPath
    func register(collectionView: UICollectionView)
    
    init(remoteControl: IRRemoteControl)
    var remoteControl: IRRemoteControl { get }
}

extension IRRemoteCollectionViewDataSource {
    func lastIndexPath() -> IndexPath {
        let section = remoteControl.sections.count-1
        let item = remoteControl.sections[section].items.count-1
        return IndexPath(item: item, section: section)
    }
}




class IRRemoteDataSource: NSObject, IRRemoteCollectionViewDataSource {
    enum DisplayType {
        case grid
        case list
    }
    var displayType: DisplayType = .grid {
        didSet {
            collectionViewRef?.reloadData()
        }
    }
    
    fileprivate let itemSpacing: CGFloat = 2
    
    internal let remoteControl: IRRemoteControl
    fileprivate var collectionViewRef: UICollectionView?
    
    required init(remoteControl: IRRemoteControl) {
        self.remoteControl = remoteControl
    }
}


//MARK: - Custom Methods

extension IRRemoteDataSource {
    
    func register(collectionView: UICollectionView) {
        self.collectionViewRef = collectionView
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: ButtonCell.reuseIdentifier)
    }
    
    fileprivate func command(forIndexPath indexPath: IndexPath) -> CommandConvertible {
        let command = remoteControl.sections[indexPath.section].items[indexPath.item]
        return command
    }
}


//MARK: - UICollectionView DataSource

extension IRRemoteDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.reuseIdentifier, for: indexPath) as! ButtonCell
        cell.updateUI(command: command(forIndexPath: indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return remoteControl.sections[section].items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return remoteControl.sections.count
    }
    
}

//MARK: - UICollectionView Delegate

extension IRRemoteDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let command = self.command(forIndexPath: indexPath)
        APIManager.send(command: command, forRemote: remoteControl.device)
    }
    
}

//MARK: - UICollectionView Delegate

extension IRRemoteDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let section = remoteControl.sections[indexPath.section]
        var desiredButtonsPerRow = section.itemsPerRow
        
        if case .list = displayType {
            desiredButtonsPerRow = 1
        }
        
        let totalSpacing = (desiredButtonsPerRow - 1) * itemSpacing
        let width = (collectionView.bounds.width - totalSpacing) / desiredButtonsPerRow
        
        let size = CGSize(width: width, height: 50)
        return size
    }
}



//MARK: - Cell Class

class ButtonCell: UICollectionViewCell {
    static var reuseIdentifier: String = "ButtonCell"
    
    private var command: CommandConvertible!
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.allowsDefaultTighteningForTruncation = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    
    func updateUI(command: CommandConvertible) {
        self.command = command
        
        label.text = command.humanReadableName()
        label.textColor = command.color()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = Style.Color.clear.color()
        contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leadingMargin).offset(0)
            make.trailing.equalTo(contentView.snp.trailingMargin).inset(0)
            make.top.equalTo(contentView.snp.topMargin).offset(0)
            make.bottom.equalTo(contentView.snp.bottomMargin).inset(0)
        }
        
        let bg = UIView(frame: frame)
        bg.backgroundColor = Style.Color.darkGray.color()
        bg.cornerRadius = 5
        
        let selectedBG = UIView(frame: frame)
        selectedBG.backgroundColor = Style.Color.mediumGray.color()
        selectedBG.cornerRadius = 5

        self.backgroundView = bg
        self.selectedBackgroundView = selectedBG
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}



























