//
//  SchoolDetailsView.swift
//  Assignment23SwiftUIMVVMSchool
//
//  Created by Ebillson Grand Jean on 6/25/24.
//

import SwiftUI

struct SchoolDetailsView: View {
    var school: School
    
    var body: some View {
        
        VStack {
            Image(systemName: "building.columns")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 320)
                .padding(.bottom, 24)
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text(school.school_name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .multilineTextAlignment(.center)

                Text(school.school_email ?? "School email N/A")
                    .font(.title2)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)

            }
        }
    }
}

#Preview {
    SchoolDetailsView(school: School(dbn: "defaultDBN", school_name: "School of NY", boro: "fake boro", overview_paragraph: "Fake overview paragraph", school_10th_seats: "1", academicopportunities1: "List of opportunities 1", academicopportunities2: "List of opportunities 2", ell_programs: "Fake all programs", neighborhood: "Fake neighborhood", building_code: "1001", location: "NYC", phone_number: "+1(234)-567-890", fax_number: "+1(423)-765-098", school_email: "school@email.com", website: "https://wwww.school.com/"))
}
