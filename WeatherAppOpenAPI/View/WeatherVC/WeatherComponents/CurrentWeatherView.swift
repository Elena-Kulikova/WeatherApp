//
//  CurrentWeatherView.swift
//  WeatherAppOpenAPI
//
//  Created by Elena on 04.04.2024.
//

import UIKit

final class CurrentWeatherView: UIView {
    let stackView = UIStackView()
    let cityLabel = UILabel()
    let tempLabel = UILabel()
    let weatherIcon = UIImageView()
    let cityLabelFontSize: CGFloat = 25
    let tempLabelFontSize: CGFloat = 70
    let weatherIconSize: CGFloat = 65
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCurrentWeatherUI()
        setupCurrentWeatherConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDataFor(cityLabel: String, tempLabel: String, conditionCode: Int) {
        self.cityLabel.text = cityLabel
        self.tempLabel.text = tempLabel
        self.weatherIcon.image = UIImage(systemName: systemIconNameString(for: conditionCode))
    }
}
//MARK: - setupCurrentWeatherUI
extension CurrentWeatherView {
    private func setupCurrentWeatherUI() {
        setupStack(stack: stackView, axis: .vertical, alignment: .center, spacing: spacing, distribution: nil, cornerRadius: cornerRadius)
        setupText(label: cityLabel, text: nil, textColor: .white, fontSize: cityLabelFontSize, fontWeight: .bold)
        cityLabel.textAlignment = .center
        cityLabel.adjustsFontSizeToFitWidth = true
        cityLabel.minimumScaleFactor = 0.5
        setupText(label: tempLabel, text: nil, textColor: .white, fontSize: tempLabelFontSize, fontWeight: .black)
        tempLabel.textAlignment = .center
        weatherIcon.tintColor = .white
        weatherIcon.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(tempLabel)
        stackView.addArrangedSubview(weatherIcon)

        addSubview(stackView)
    }
    
    private func setupCurrentWeatherConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            weatherIcon.widthAnchor.constraint(equalToConstant: weatherIconSize),
            weatherIcon.heightAnchor.constraint(equalToConstant: weatherIconSize)
        ])
    }
}
