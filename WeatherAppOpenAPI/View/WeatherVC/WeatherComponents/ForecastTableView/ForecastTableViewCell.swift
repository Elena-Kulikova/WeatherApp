//
//  ForecastTableViewCell.swift
//  WeatherAppOpenAPI
//
//  Created by Elena on 04.04.2024.
//


import UIKit

final class ForecastTableViewCell: UITableViewCell {
    
    static let identifier = "ForecastCell"
    private let tableStack = UIStackView()
    private let weekdayLabel = UILabel()
    private let miniWeatherIcon = UIImageView()
    private let minTempLabel = UILabel()
    private let maxTempLabel = UILabel()
    private let weekdayTextSize: CGFloat = 17
    private let tableStackOffset: CGFloat = 10
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = mainBGColor
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(weekdayText: String, conditionCode: Int, minTempText: String, maxTempText: String) {
        weekdayLabel.text = weekdayText
        miniWeatherIcon.image = UIImage(systemName: systemIconNameString(for: conditionCode))
        minTempLabel.text = minTempText
        maxTempLabel.text = maxTempText
    }
}

//MARK: - setupCellUI
extension ForecastTableViewCell {
    private func setupCellUI() {
        setupStack(stack: tableStack, axis: .horizontal, alignment: .center, spacing: spacing, distribution: .fillEqually, cornerRadius: cornerRadius)
        setupText(label: weekdayLabel, text: nil, textColor: .white, fontSize: weekdayTextSize, fontWeight: .bold)
        miniWeatherIcon.tintColor = .white
        miniWeatherIcon.contentMode = .center
        setupText(label: minTempLabel, text: nil, textColor: .white, fontSize: weekdayTextSize, fontWeight: .medium)
        setupText(label: maxTempLabel, text: nil, textColor: .white, fontSize: weekdayTextSize, fontWeight: .medium)

        tableStack.addArrangedSubview(weekdayLabel)
        tableStack.addArrangedSubview(miniWeatherIcon)
        tableStack.addArrangedSubview(minTempLabel)
        tableStack.addArrangedSubview(maxTempLabel)
        addSubview(tableStack)
        
        tableStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableStack.topAnchor.constraint(equalTo: topAnchor, constant: tableStackOffset),
            tableStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: tableStackOffset),
            tableStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -tableStackOffset),
            tableStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -tableStackOffset)
        ])
    }
}
