//
//  NewsVC.swift
//  neoNews
//
//  Created by Али  on 22.08.2023.
//


import UIKit
import SnapKit

class NewsVC: UIViewController {

    let news: [News] = [News(id: 1, title: "12", content: "!23", image: "312", created_date: "321", category: "!23"),
                        News(id: 1, title: "12", content: "!23", image: "312", created_date: "321", category: "!23")
    ]
    
    lazy private var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 343, height: 115)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.identifier)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collection)
        collection.delegate = self
        collection.dataSource = self
        setupConstraints()
    }
    
    func setupConstraints() {
        collection.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(28)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension NewsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else { return UICollectionViewCell()}
        cell.configure(news[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = NewsDescriptionVC()
//        vc.selectedCategory = indexPath.row + 1

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
