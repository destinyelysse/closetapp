//
//  ArticleView.swift
//  Closet
//
//  Created by Destiny Serna on 12/7/20.
//

import SwiftUI

struct ArticleView: View {
    
    let article: articleOfClothing
    
    var body: some View {
        VStack {
            Text(self.article.name)
            Text(self.article.status)
            Text(self.article.rating)
            Text(self.article.type)
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    
    let article = articleOfClothing()
    
    static var previews: some View {
        ArticleView(article: article)
    }
}
