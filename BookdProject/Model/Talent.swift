//
//  Talent.swift
//  BookdProject
//
//  Created by Øystein Thorheim on 02/02/2022.
//

import Foundation

struct Talent: Identifiable {
    var id = UUID().uuidString
    let title: String
    let description: String
    let price: String
    let imageName: String
}


var soloartists: [Talent] = [
    .init(title: "Kappekoff", description: "Magnus Falkenberg fra Oslo er både bassist og produsent. Musikken hans minner om det elektroniske Oslo-diskoteket populært av artister som Lindstrøm, Todd Terje og Ralph Myerz, da han blander pop, jazz, improvisasjon og elektronisk musikk.", price: "17.000 Kr", imageName: "kappekoff"),
    
    .init(title: "Migos", description: "Migos er en amerikansk hiphop-trio fra Lawrenceville, Georgia, grunnlagt i 2008. Gruppen er sammensatt av tre rappere kjent under scenenavnene deres Quavo, Offset og Takeoff.", price: "420.000 Kr", imageName: "migos"),
    
        .init(title: "Ows", description: "Ows er en up and coming norsk produsent og artist som tar den norske musikk bransjen med storm, uten owsen blir det ingen fest", price: "69.000 Kr", imageName: "owsen"),
    
    .init(title: "G-Eazy", description: "Gerald Earl Gillum, bedre kjent under artistnavnet G-Eazy, er en amerikansk rapper og plateprodusent. Hans første store album, These Things Happen, ble gitt ut 23. juni 2014, og nådde toppen som nummer 3 på den amerikanske Billboard 200.", price: "300.000 Kr", imageName: "g-eazy"),
]

var djs: [Talent] = [
    .init(title: "Fingern", description: "Fingern er tidligere norgesmester i dj'ing og 1/3 av rapgruppen Klovner i Kamp, Han har flere år erfaring med å spille på utesteder i både innlandet og utlandet, eventer, bryllup og fester", price: "30.000 Kr", imageName: "thomas"),
    
    .init(title: "Dj Ruben", description: "DJ som spiller musikken som passer nettopp din fest, reiser rundt i hele landet for å spille der han behøves.", price: "5.000 Kr", imageName: "ruben-pettersen"),
    
        .init(title: "DJ Nupastek", description: "DJ Nupastek er mest kjent for å lage norges beste russelåter, men lager også annen musikk. Med over en million streams på spotify kan DJ Nupastek garanterwe stek stemning.", price: "1.000.000 Kr", imageName: "dj-nupastek"),
    
    .init(title: "Pia Skevik", description: "Pia er en norsk disc jockey og journalist. Skevik jobber som musikkprodusent og programleder i NRK P1 og har siden 2004 jobbet som DJ og programleder i NRK P3-programmet Pia.", price: "10.000 Kr", imageName: "pia-skevik"),
    
    .init(title: "Josef Bamba", description: "Josef Bama er en av Norges mestreisende DJas, som har sitt utspring fra klubbscenen i Tromsø. Han vant Modiva Corona i 2008, en av verdens største DJ konkurranser, som i ettertid ga han kontrakt med den ikoniske nattklubbkjeden Pacha Ibiza og spillejobber i noen av de mest prestisjefulle utestedene i verden.", price: "18.000 Kr", imageName: "josef-bamba"),
    
    .init(title: "DJarle", description: "DJarle er en DJ og produsent fra Norge. Favorittstilene hans er elektro og vokal hous,. DJarle har vært på lineup med noen av Norges største artister.", price: "14.000 Kr", imageName: "jarle-espeland"),
]

var speakers: [Talent] = [
    .init(title: "Jordan Peterson", description: "Jordan Bernt Peterson er en kanadisk klinisk psykolog, YouTube-personlighet, forfatter og professor emeritus i psykologi. Han begynte å få bred oppmerksomhet på slutten av 2010-tallet for sitt syn på kulturelle og politiske spørsmål, ofte beskrevet som konservative.", price: "240.000", imageName: "jordan-peterson"),
    
    .init(title: "Jordan Belfort", description: "Jordan Ross Belfort er en amerikansk gründer, foredragsholder, forfatter og tidligere aksjemegler", price: "$24", imageName: "jordan-belfort"),
]


//Search
class TalentController : ObservableObject{
    
    let talents = [Talent(title: "$djs,$soloartister", description: "", price: "", imageName: "")]

    @Published var publishedInfo = [Talent]()
    
    init(){
        
        publishedInfo = talents
    }
    
    public func search(for key: String) {
        publishedInfo = talents.filter {key.isEmpty ? true : $0.title.lowercased().contains(key.lowercased())}
       }
   }
