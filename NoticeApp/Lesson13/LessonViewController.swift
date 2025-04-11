//
//  LessonViewController.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 11.04.2025.
//

import UIKit

/*
 NSCollectionLayoutBoundarySupplementaryItem
 boundarySupplementalyItems
 
 1 - delegate + viewForSupplementaryElementOfKind
 2 - create header cell - UICollectionReusableView
 3 - register
 4 - setup size
 5 - add in section
 
 UICollectionViewCompositionalLayout
 NSCollectionLayoutSection
*/
 
class LessonViewController: UIViewController {
    
    private let data = CollectionSection.MockData()
    
    private lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.delegate = self

        $0.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.reuseId)
//        $0.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer")
        
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            default: self.createBannerSection()
            }
        }
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(296 + 16), heightDimension: .absolute(160))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        section.boundarySupplementaryItems = [self.setupHeaderSize()]
        
        return section
    }
    
    private func setupHeaderSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44)),
              elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
//    private func setupFooterSize() -> NSCollectionLayoutBoundarySupplementaryItem {
//        .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(34)),
//              elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
    }
    
}


extension LessonViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.data[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.contentView.backgroundColor = .appGray
            cell.contentView.layer.cornerRadius = 8
            cell.contentView.clipsToBounds = true
            return cell
        }
    }
}

extension LessonViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let item = self.data[indexPath.section]
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.reuseId, for: indexPath) as! Header
            
            switch indexPath.section {
            case 0: header.setupHeader(text: item.header, type: .news)
            case 1: header.setupHeader(text: item.header, type: .events)
            default : header.setupHeader(text: item.header, type: .users)
            }
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
