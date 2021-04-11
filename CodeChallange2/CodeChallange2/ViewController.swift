//
//  ViewController.swift
//  CodeChallange2
//
//  Created by Ron Avrahami on 4/11/21.
//

import UIKit

enum Section {
    case main
}

class ViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: CardDataSource!
    var sections = [Section]()
    var cards = [Card]()
    var jsonManager = JSONManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.allowsSelection = false
        
        jsonManager.drawCards(deck: jsonManager.deck)
    }
    
    func configureDataSource() {
        
        dataSource = CardDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, card) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCollectionViewCell

            //cell?.update(image: image)
            return cell
        })
        updateDataSource()
    }
    
    func updateDataSource() {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Card>()
        snapshot.appendSections([.main])
        
        snapshot.appendItems(cards)
        
        sections = snapshot.sectionIdentifiers
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil )
    }

}

class CardDataSource: UICollectionViewDiffableDataSource<Section, Card> {
}
