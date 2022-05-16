//
//  TranslateVC.swift
//  PersonalTransGame
//
//  Created by Ирина Кольчугина on 15.04.2022.
//

import UIKit
import SnapKit
import Combine

final class TranslateVC: UIViewController {

    private lazy var firstLangTitleLabel: UILabel = {
        let firstLangTitleLabel = UILabel()
        firstLangTitleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        firstLangTitleLabel.textColor = .black
        firstLangTitleLabel.text = Languages.english.nameRus
        return firstLangTitleLabel
    }()

    private lazy var secondLangTitleLabel: UILabel = {
        let secondLangTitleLabel = UILabel()
        secondLangTitleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        secondLangTitleLabel.textColor = .black
        secondLangTitleLabel.text = Languages.russian.nameRus
        return secondLangTitleLabel
    }()

    private lazy var firstLangTextView: UITextView = {
        let firstLangTextView = UITextView()
        firstLangTextView.text = Title.writeText.textRus
        firstLangTextView.textColor = .lightGray
        return firstLangTextView
    }()

    private lazy var secondLangTextView: UITextView = {
        let secondLangTextView = UITextView()
        secondLangTextView.text = Title.writeText.textRus
        secondLangTextView.textColor = .lightGray
        return secondLangTextView
    }()

    private lazy var addToDictionaryButton: UIButton = {
        let addToDictionaryButton = UIButton()
        addToDictionaryButton.backgroundColor = .blue
        addToDictionaryButton.setTitle(Title.addToDictionary.textRus, for: .normal)
        addToDictionaryButton.addTarget(
            self,
            action: #selector(setAddToDictionaryAction(_:)),
            for: .touchUpInside
        )
        return addToDictionaryButton
    }()

    private var viewModel = TranslateViewModel()

    private var observers = [AnyCancellable]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupViewsConstraint()
        setupViews()
    }

    private func setupViews() {
        firstLangTextView.delegate = self
        firstLangTextView.layer.borderWidth = 1
        firstLangTextView.layer.borderColor = UIColor.gray.cgColor
        firstLangTextView.layer.cornerRadius = 7


        secondLangTextView.delegate = self
        secondLangTextView.layer.borderWidth = 1
        secondLangTextView.layer.borderColor = UIColor.gray.cgColor
        secondLangTextView.layer.cornerRadius = 7

        addToDictionaryButton.layer.cornerRadius = 7
    }

    private func setupViewsConstraint() {
        view.addSubview(firstLangTitleLabel)
        firstLangTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(17)
        }

        view.addSubview(firstLangTextView)
        firstLangTextView.snp.makeConstraints { make in
            make.top.equalTo(firstLangTitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(100)
        }

        view.addSubview(secondLangTitleLabel)
        secondLangTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLangTextView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(17)
        }

        view.addSubview(secondLangTextView)
        secondLangTextView.snp.makeConstraints { make in
            make.top.equalTo(secondLangTitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(100)
        }

        view.addSubview(addToDictionaryButton)
        addToDictionaryButton.snp.makeConstraints { make in
            make.top.equalTo(secondLangTextView.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.centerY.equalToSuperview()
        }
    }

    private func setTextViewPlaceholder(textView: UITextView) {
        textView.text = Title.writeText.textRus
        textView.textColor = .lightGray
    }

    @objc private func setAddToDictionaryAction(_ sender: UIButton) {
        let model = DictionaryModel(
            firstLang: firstLangTitleLabel.text.nonOptional(),
            firstText: firstLangTextView.text.nonOptional(),
            secondLang: secondLangTitleLabel.text.nonOptional(),
            secondText: secondLangTextView.text.nonOptional()
        )
        viewModel.setSaving(model: model)
        setShowingAlirt(
            title: Title.congratulation.textRus,
            messege: Title.successAdded.textRus,
            buttonTitle: Title.resume.textRus
        )
    }

    private func setShowingAlirt(
        title: String,
        messege: String,
        buttonTitle: String
    ) {
        let successAlert = UIAlertController(
            title: title,
            message: messege,
            preferredStyle: .alert
        )

        let okButton = UIAlertAction(
            title: buttonTitle, 
            style: .default
        )
        successAlert.addAction(okButton)

        present(successAlert, animated: true) { [weak self] in
            guard let self = self else { return }
            self.setTextViewPlaceholder(textView: self.firstLangTextView)
            self.setTextViewPlaceholder(textView: self.secondLangTextView)
        }
    }

    private func setPublishers() {
        viewModel
            .$actionsState
            .sink { [weak self] state in
                switch state {
                case .empty:
                    break
                case .errorSaving:
                    self?.setShowingAlirt(
                        title: Title.error.textRus,
                        messege: Title.failureAdd.textRus,
                        buttonTitle: Title.ok.textRus
                    )
                }
            }
            .store(in: &observers)
    }

}

extension TranslateVC: UITextViewDelegate {


    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
        return true
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            setTextViewPlaceholder(textView: textView)
        }
    }
}

