


import UIKit

class MovieSecondViewController: UIViewController {
    
    // MARK: - Ui
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(BiographyCollectionCell.self, forCellWithReuseIdentifier: BiographyCollectionCell.identifier)
        collection.register(BookCoverCollectionCell.self, forCellWithReuseIdentifier: BookCoverCollectionCell.identifier)
        collection.register(ListCollectionCell.self, forCellWithReuseIdentifier: ListCollectionCell.identifier)
        collection.register(CustomHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomHeader.identifier)

        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"
        view.backgroundColor = .black
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func createLayout() -> UICollectionViewCompositionalLayout {

        // Возвращение созданного макета для использования в коллекции
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0:
                // Section -> Group -> item -> size
                let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let bigItem = NSCollectionLayoutItem(layoutSize: bigItemSize)
                bigItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(200))
                
                let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [bigItem])
                

                let layoutSection = NSCollectionLayoutSection(group: mainGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                         elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top)
                
                layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
                layoutSection.boundarySupplementaryItems = [header]
                
                return layoutSection
                
            case 1:
                // Section -> Group -> item -> size
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                       heightDimension: .fractionalHeight(1 / 4.5))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 1)
                
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                
                // Установка поведения прокрутки
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                        heightDimension: .estimated(30))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                         elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top)
                
                layoutSection.boundarySupplementaryItems = [header]
                
                return layoutSection
               
            default:
                // Section -> Group -> item -> size
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalHeight(0.5))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 10)
                
                
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 2.5, trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                        heightDimension: .estimated(70))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                
                layoutSection.boundarySupplementaryItems = [header]
                
                return layoutSection
               
            }
        }
    }

    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
}

extension MovieSecondViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        CompositionalModel.modelsArray.count

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            CompositionalModel.modelsArray[section].count
        case 1:
            CompositionalModel.modelsArray[section].count
         default:
            CompositionalModel.modelsArray[section].count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BiographyCollectionCell.identifier, for: indexPath) as? BiographyCollectionCell
            let data = CompositionalModel.modelsArray[indexPath.section][indexPath.item]
            cell?.configure(with: data, index: indexPath.item + 1)
            return cell ?? UICollectionViewCell()
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCoverCollectionCell.identifier, for: indexPath) as? BookCoverCollectionCell
            let currentImage = BookModel.images[indexPath.item]
            cell?.configure(with: currentImage)
            return cell ?? UICollectionViewCell()
           
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionCell.identifier, for: indexPath) as? ListCollectionCell
            let currentModel = CompositionalModel.modelsArray[indexPath.section][indexPath.item]
            cell?.configure(with: currentModel)
            
            return cell ?? UICollectionViewCell()
           
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeader.identifier, for: indexPath) as! CustomHeader
            header.label.text = "Featured"
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeader.identifier, for: indexPath) as! CustomHeader
            header.label.text = "Your collection"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeader.identifier, for: indexPath) as! CustomHeader
            header.label.text = "Best sellers"
            return header
        }
       
        
        
    }
}


#Preview {
        MovieSecondViewController()
    }
