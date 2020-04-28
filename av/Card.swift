import SwiftUI

struct Card: View {
@State var show: Bool = false
  
   var body: some View {
       VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Day 1")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    Text("20 Sections")
                        .foregroundColor(Color.white.opacity(0.7))
                }
                Spacer()
                
                Image(uiImage: #imageLiteral(resourceName: "Logo3"))
                
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .padding(.bottom, 20)
            Spacer()
            
            Image(uiImage: #imageLiteral(resourceName: "Card5"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
            
        }
        .padding(show ? 30 : 20)
        .padding(.top, show ? 30 : 0)
        .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280)
        .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .onTapGesture {
            self.show.toggle()
         }
       .edgesIgnoringSafeArea(.all)
        }
      }

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}

