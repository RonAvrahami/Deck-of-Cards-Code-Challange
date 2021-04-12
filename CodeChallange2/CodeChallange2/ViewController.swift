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
    @IBOutlet weak var redrawButton: UIButton!
    @IBOutlet weak var evaluateButton: UIButton!
    @IBOutlet weak var evaluationLabel: UILabel!
    
    var dataSource: CardDataSource!
    var sections = [Section]()
    var cards = [Card]()
    var jsonManager = JSONManager()
    var delay: TimeInterval = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.allowsSelection = false
        collectionView.isScrollEnabled = false
        
        collectionView.collectionViewLayout = configureCollectionViewLayout()
        
        jsonManager.drawCards()
        cards = jsonManager.cards
        configureDataSource()
        
        evaluationLabel.isHidden = true
    }
    
    func configureDataSource() {
        
        dataSource = CardDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, card) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCollectionViewCell
            
            if let image = card.uiImage {
                cell?.update(image: image)
            }
            return cell
        })
        updateDataSource()
    }
    
    func updateDataSource() {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Card>()
        snapshot.appendSections([.main])
        
        snapshot.appendItems(cards)
        
        sections = snapshot.sectionIdentifiers
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        
        print(cards)
    }
    
    func configureCollectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 5)
            group.interItemSpacing = .fixed(-100)
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        }
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.isHidden = true
        self.evaluateButton.isEnabled = false
        self.redrawButton.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            
            cell.isHidden = false
            self.delay = 0.4
            let myreact = cell.frame
            cell.frame = CGRect(x: cell.frame.origin.x+320, y: cell.frame.origin.y, width: cell.frame.size.width, height: cell.frame.size.height)
            
            let value = Double(indexPath.row)*0.1
            UIView.animate(withDuration: 0.6, delay:value, options: .curveEaseInOut, animations: {
                
                cell.frame = CGRect(x: myreact.origin.x, y: myreact.origin.y, width: myreact.size.width, height: myreact.size.height)
                
            }) { (_) in
                self.redrawButton.isEnabled = true
                self.evaluateButton.isEnabled = true
            }
        }
    }
    
    @IBAction func redrawButtonTapped(_ sender: Any) {
       
        DispatchQueue.main.async { [self] in
            evaluationLabel.text = ""
            evaluationLabel.isHidden = true
            
            jsonManager.drawCards()
            cards = jsonManager.cards
            updateDataSource()
        }
    }
    @IBAction func evaluateButtonTapped(_ sender: Any) {
        evaluationLabel.isHidden = false
        evaluationLabel.text = "Evaluation: \((evaluateHand(hand: cards)))"
        
    }
}

class CardDataSource: UICollectionViewDiffableDataSource<Section, Card> {
}
