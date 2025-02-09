//
//  PDFGenerator.swift
//  CoinCatcher
//
//  Created by Mohammed Ruhit on 27/1/25.
//

import UIKit
import SwiftUI

class PDFGenerator {
    static func generatePDF(report: String, completion: @escaping (URL?) -> Void) {
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: 612, height: 792))
        
        let pdfData = pdfRenderer.pdfData { context in
            context.beginPage()
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 14),
                .paragraphStyle: paragraphStyle
            ]
            
            let attributedText = NSAttributedString(string: report, attributes: attributes)
            attributedText.draw(in: CGRect(x: 20, y: 20, width: 572, height: 752))
        }
        
        let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent("TaxReport.pdf")
        do {
            try pdfData.write(to: fileURL)
            completion(fileURL)
        } catch {
            completion(nil)
        }
    }
}
