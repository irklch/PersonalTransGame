//
//  DictionaryCollectionVC.swift
//  PeronalTransGame
//
//  Created by Ирина Кольчугина on 17.05.2022.
//

import Foundation
import UIKit
import SnapKit

final class DictionaryCollectionVC: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let collectionFlow = UICollectionViewFlowLayout()
        collectionFlow.scrollDirection = .vertical
        collectionFlow.sectionInset = UIEdgeInsets(
            top: 16,
            left: 16,
            bottom: 0,
            right: 16
        )
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionFlow
        )
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private lazy var emptyLabel: UILabel = {
        let emptyLabel = UILabel()
        emptyLabel.textColor = .darkGray
        emptyLabel.font = .systemFont(ofSize: 20, weight: .bold)
        emptyLabel.text = Title.emptyDictionary.textRus
        emptyLabel.textAlignment = .center
        return emptyLabel
    }()

    private lazy var translateButton: UIButton = {
        let translateButton = UIButton()
        translateButton.backgroundColor = .blue
        translateButton.setTitle(Title.addToDictionary.textRus, for: .normal)
        translateButton.addTarget(
            self,
            action: #selector(setOpenTranslateVC(_:)),
            for: .touchUpInside
        )
        return translateButton
    }()

    private lazy var emptyView: UIView = {
        let emptyView = UIView()
        emptyView.backgroundColor = .white
        return emptyView
    }()

    private let viewModel = DictionaryCollectionViewModel()

    override func viewDidLoad() {
        view.backgroundColor = .white
        setupCollectionViewConstraint()
        setEmptyViewConstraint()
    }

    private func setupCollectionViewConstraint() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }

    private func setEmptyViewConstraint() {
        view.addSubview(emptyView)
        emptyView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }

        emptyView.addSubview(translateButton)
        translateButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }

        emptyView.addSubview(emptyLabel)
        emptyLabel.snp.makeConstraints { make in
            make.bottom.equalTo(translateButton.snp.top).offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(25)
        }
    }

    @objc private func setOpenTranslateVC(_ sender: UIButton) {
        navigationController?.tabBarController?.selectedIndex = 1
    }


}

extension DictionaryCollectionVC: UICollectionViewDelegate {

}

extension DictionaryCollectionVC: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        guard viewModel.words.count > 0 else {
            emptyView.isHidden = false
            return 0
        }
        emptyView.isHidden = true
        return viewModel.words.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return .init(frame: .zero)
    }


}
