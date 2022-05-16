//
//  SettingsVC.swift
//  PersonalTransGame
//
//  Created by Ирина Кольчугина on 15.04.2022.
//

import UIKit
import SnapKit

final class SettingsVC: UIViewController {

    private lazy var dictionaryButton: UIButton = {
        let dictionaryButton = UIButton()
        dictionaryButton.backgroundColor = .blue
        dictionaryButton.setTitle(Title.dictionary.textRus, for: .normal)
        dictionaryButton.addTarget(
            self,
            action: #selector(setOpenDictionaryVC(_:)),
            for: .touchUpInside
        )
        return dictionaryButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupViewsConstraint()
    }

    private func setupViewsConstraint() {
        view.addSubview(dictionaryButton)
        dictionaryButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
        dictionaryButton.layer.cornerRadius = 7
    }

    @objc private func setOpenDictionaryVC(_ sender: UIButton) {
        let vc = DictionaryCollectionVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

