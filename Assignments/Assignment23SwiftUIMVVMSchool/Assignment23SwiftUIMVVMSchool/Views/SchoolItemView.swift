//
//  SchoolItemView.swift
//  Assignment23SwiftUIMVVMSchool
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import SwiftUI

struct SchoolItemView: View {
    var school: School
    
    var body: some View {
        HStack {
            
            Image(systemName: "building.columns")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .padding(.trailing, 16)
        
            VStack(alignment: .leading) {
                Text(school.school_name)
                    .font(.title2)
                    .bold()
                Text(school.school_email ?? "School Name N/A")
                    .font(.title3)
                    .foregroundStyle(.gray)
            }
        }
        
    }
}

#Preview {
    SchoolItemView(school: School(dbn: "defaultDBN", school_name: "School of NY", boro: "fake boro", overview_paragraph: "Fake overview paragraph", school_10th_seats: "1", academicopportunities1: "List of opportunities 1", academicopportunities2: "List of opportunities 2", ell_programs: "Fake all programs", neighborhood: "Fake neighborhood", building_code: "1001", location: "NYC", phone_number: "+1(234)-567-890", fax_number: "+1(423)-765-098", school_email: "school@email.com", website: "https://wwww.school.com/"))
}

