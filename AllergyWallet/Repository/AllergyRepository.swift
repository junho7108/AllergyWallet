//
//  AllergyRepository.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/4/24.
//

import Foundation

protocol AllergyRepositoryType {
    func fetchAllergies() async -> [AllergyCategory]
}

final class AllergyRepository: AllergyRepositoryType {
    func fetchAllergies() async -> [AllergyCategory] {
        if let jsonData = FileService.shared.loadJSONFromFile(filename: "AllergyData") {
            if let categories = FileService.shared.parse(data: jsonData, modelType: [AllergyCategory].self) {
                print("🟢 FileService success!")
                return categories
            }
        }
        
        return await AllergyRepositoryTest().fetchAllergies()
    }
}

final class AllergyRepositoryTest: AllergyRepositoryType {
    func fetchAllergies() async -> [AllergyCategory] {
        return await [
            AllergyCategory(korName: "우유", engName: "Milk", emoji: "🥛",
                            allergies: [
                                Allergy(korName: "우유", engName: "Milk", emoji: "🥛")
                            ]),
            
            AllergyCategory(korName: "계란", engName: "Egg", emoji: "🥚",
                            allergies: [
                                Allergy(korName: "계란", engName: "Egg", emoji: "🥚")
                            ]),
            
            AllergyCategory(korName: "대두", engName: "Soy", emoji: "🫛",
                            allergies: [
                                Allergy(korName: "대두", engName: "Soy", emoji: "🫛")
                            ]),
            
            AllergyCategory(korName: "땅콩", engName: "Peanut", emoji: "🥜",
                            allergies: [
                                Allergy(korName: "땅콩", engName: "Peanut", emoji: "🥜")
                            ]),
            
            AllergyCategory(korName: "견과류", engName: "TreeNut", emoji: "🌰",
                            allergies: [
                                Allergy(korName: "아몬드", engName: "Almonds", emoji: "🌰"),
                                Allergy(korName: "브라질너트", engName: "Brazil Nuts", emoji: "🌰"),
                                Allergy(korName: "캐슈넛", engName: "Cashews", emoji: "🌰"),
                                Allergy(korName: "밤", engName: "Chestnuts", emoji: "🌰"),
                                Allergy(korName: "헤이즐넛", engName: "Hazelnuts", emoji: "🌰"),
                                Allergy(korName: "마카다미아 너트", engName: "Macadamia nuts", emoji: "🌰"),
                                Allergy(korName: "피칸", engName: "Pecans", emoji: "🌰"),
                                Allergy(korName: "잣", engName: "Pine nuts", emoji: "🌰"),
                                Allergy(korName: "피스타치오", engName: "Pistachios", emoji: "🌰"),
                                Allergy(korName: "호두", engName: "Walnuts", emoji: "🌰")
                            ]),
            
            AllergyCategory(korName: "밀", engName: "Wheat", emoji: "🌾",
                            allergies: [
                                Allergy(korName: "밀", engName: "Wheat", emoji: "🌾")
                            ]),
            
            AllergyCategory(korName: "씨앗", engName: "Seed", emoji: "🌱",
                            allergies: [
                                Allergy(korName: "캐롭씨", engName: "Carob seeds", emoji: "🌱"),
                                Allergy(korName: "치아씨", engName: "Chia seeds", emoji: "🌱"),
                                Allergy(korName: "아마씨", engName: "Flaxseeds", emoji: "🌱"),
                                Allergy(korName: "겨자씨", engName: "Mustard seeds", emoji: "🌱"),
                                Allergy(korName: "들깨", engName: "Perilla Seed", emoji: "🌾"),
                                Allergy(korName: "양귀비씨", engName: "Poppy seeds", emoji: "🌺"),
                                Allergy(korName: "호박씨", engName: "Pumpkin seeds", emoji: "🎃"),
                                Allergy(korName: "참깨", engName: "Sesame", emoji: "🌾"),
                                Allergy(korName: "해바라기씨", engName: "Sunflower seeds", emoji: "🌻")
                            ]),
            
            AllergyCategory(korName: "곡물", engName: "Grain", emoji: "🌾",
                            allergies: [
                                Allergy(korName: "보리", engName: "Barley", emoji: "🌾"),
                                Allergy(korName: "메밀", engName: "Buckwheat", emoji: "🌿"),
                                Allergy(korName: "옥수수", engName: "Corn", emoji: "🌽"),
                                Allergy(korName: "조", engName: "Millet", emoji: "🌾"),
                                Allergy(korName: "귀리", engName: "Oats", emoji: "🌾"),
                                Allergy(korName: "퀴노아", engName: "Quinoa", emoji: "🌿"),
                                Allergy(korName: "쌀", engName: "Rice", emoji: "🌾"),
                                Allergy(korName: "호밀", engName: "Rye", emoji: "🌾")
                            ]),
            
            AllergyCategory(korName: "글루텐", engName: "Gluten", emoji: "🍞",
                            allergies: [
                                Allergy(korName: "글루텐", engName: "Gluten", emoji: "🍞")
                            ]),
            
            AllergyCategory(korName: "콩과 식물", engName: "Legume", emoji: "🫘",
                            allergies: [
                                Allergy(korName: "콩과 식물", engName: "Legume", emoji: "🫘")
                            ]),
            
            AllergyCategory(korName: "생선", engName: "Fish", emoji: "🐟",
                            allergies: [
                                Allergy(korName: "생선", engName: "Fish", emoji: "🐟")
                            ]),
            
            AllergyCategory(korName: "갑갹류", engName: "Crustacean", emoji: "🦀",
                            allergies: [
                                Allergy(korName: "게", engName: "Crab", emoji: "🦀"),
                                Allergy(korName: "가재", engName: "Crayfish", emoji: "🦞"),
                                Allergy(korName: "바닷가재", engName: "Langoustine", emoji: "🦞"),
                                Allergy(korName: "랍스터", engName: "Lobster", emoji: "🦞"),
                                Allergy(korName: "새우", engName: "Shrimp", emoji: "🦐")
                            ]),
            
            AllergyCategory(korName: "연체류", engName: "Mollusks", emoji: "🦪",
                            allergies: [
                                Allergy(korName: "전복", engName: "Abalone", emoji: "🦪"),
                                Allergy(korName: "조개", engName: "Clam", emoji: "🦪"),
                                Allergy(korName: "바지락", engName: "Cockle", emoji: "🦪"),
                                Allergy(korName: "홍합", engName: "Mussel", emoji: "🦪"),
                                Allergy(korName: "문어", engName: "Octopus", emoji: "🐙"),
                                Allergy(korName: "굴", engName: "Oyster", emoji: "🦪"),
                                Allergy(korName: "가리비", engName: "Scallop", emoji: "🦪"),
                                Allergy(korName: "오징어", engName: "Squid", emoji: "🦑"),
                                Allergy(korName: "소라(골뱅이)", engName: "Whelk", emoji: "🐚")
                            ]),
            
            AllergyCategory(korName: "과일", engName: "Fruit", emoji: "🍎",
                            allergies: [
                                Allergy(korName: "아세로라", engName: "Acerola", emoji: "🍒"),
                                Allergy(korName: "사과", engName: "Apple", emoji: "🍎"),
                                Allergy(korName: "바나나", engName: "Banana", emoji: "🍌"),
                                Allergy(korName: "코코넛", engName: "Coconut", emoji: "🥥"),
                                Allergy(korName: "대추야자", engName: "Date", emoji: "🌴"),
                                Allergy(korName: "포도", engName: "Grape", emoji: "🍇"),
                                Allergy(korName: "대추", engName: "Jujube", emoji: "🫘"),
                                Allergy(korName: "키위", engName: "Kiwi", emoji: "🥝"),
                                Allergy(korName: "올리브", engName: "Olive", emoji: "🫒"),
                                Allergy(korName: "배", engName: "Pear", emoji: "🍐"),
                                Allergy(korName: "파인애플", engName: "Pineapple", emoji: "🍍"),
                                Allergy(korName: "석류", engName: "Pomegranate", emoji: "🍒"),
                            ]),
            
            AllergyCategory(korName: "석과류", engName: "Stone Fruit", emoji: "🍑",
                            allergies: [
                                Allergy(korName: "살구", engName: "Apricot", emoji: "🍑"),
                                Allergy(korName: "체리", engName: "Cherry", emoji: "🍒"),
                                Allergy(korName: "망고", engName: "Mango", emoji: "🥭"),
                                Allergy(korName: "매실", engName: "Mume", emoji: "🍏"),
                                Allergy(korName: "넥타린", engName: "Nectarine", emoji: "🍑"),
                                Allergy(korName: "복숭아", engName: "Peach", emoji: "🍑"),
                                Allergy(korName: "자두", engName: "Plum", emoji: "🍑")
                            ]),
            
            AllergyCategory(korName: "감굴류", engName: "Citrus", emoji: "🍊",
                            allergies: [
                                Allergy(korName: "자몽", engName: "Grapefruit", emoji: "🍊"),
                                Allergy(korName: "레몬", engName: "Lemon", emoji: "🍋"),
                                Allergy(korName: "라임", engName: "Lime", emoji: "🍋‍🟩"),
                                Allergy(korName: "만다린", engName: "Mandarin", emoji: "🍊"),
                                Allergy(korName: "오렌지", engName: "Orange", emoji: "🍊"),
                                Allergy(korName: "귤", engName: "Tangerine", emoji: "🍊")
                            ]),
            
            AllergyCategory(korName: "베리류", engName: "Berries", emoji: "🫐",
                            allergies: [
                                Allergy(korName: "블랙라즈베리(복분자)", engName: "Black Raspberry", emoji: "🫐"),
                                Allergy(korName: "블랙베리", engName: "Blackberry", emoji: "🫐"),
                                Allergy(korName: "블루베리", engName: "Blueberry", emoji: "🫐"),
                                Allergy(korName: "크랜베리", engName: "Cranberry", emoji: "🍒"),
                                Allergy(korName: "라즈베리", engName: "Raspberry", emoji: "🍓"),
                                Allergy(korName: "딸기", engName: "Strawberry", emoji: "🍓")
                            ]),
            
            AllergyCategory(korName: "멜론류", engName: "Melons", emoji: "🍈",
                            allergies: [
                                Allergy(korName: "허니듀 멜론", engName: "Honeydew melon", emoji: "🍈"),
                                Allergy(korName: "머스크 멜론", engName: "Muskmelon", emoji: "🍈"),
                                Allergy(korName: "참외", engName: "Oriental melon", emoji: "🍈"),
                                Allergy(korName: "수박", engName: "Watermelon", emoji: "🍉")
                            ]),
            
            AllergyCategory(korName: "야채", engName: "Vegetable", emoji: "🥬",
                            allergies: [
                                Allergy(korName: "아스파라거스", engName: "Asparagus", emoji: "🥬"),
                                Allergy(korName: "아보카도", engName: "Avocado", emoji: "🥑"),
                                Allergy(korName: "도라지", engName: "Bellflower roots", emoji: "🫚"),
                                Allergy(korName: "브로콜리", engName: "Broccoli", emoji: "🥦"),
                                Allergy(korName: "양배추", engName: "Cabbage", emoji: "🥬"),
                                Allergy(korName: "당근", engName: "Carrots", emoji: "🥕"),
                                Allergy(korName: "샐러리", engName: "Celery", emoji: "🥬"),
                                Allergy(korName: "쑥갓", engName: "Crown daisy", emoji: "🌿"),
                                Allergy(korName: "오이", engName: "Cucumber", emoji: "🥒"),
                                Allergy(korName: "더덕", engName: "Deodeok", emoji: "🫚"),
                                Allergy(korName: "가지", engName: "Eggplants", emoji: "🍆"),
                                Allergy(korName: "마늘", engName: "Garlic", emoji: "🧄"),
                                Allergy(korName: "인삼", engName: "Garlic", emoji: "🫚"),
                                Allergy(korName: "상추", engName: "Lettuce", emoji: "🥬"),
                                Allergy(korName: "연근", engName: "Lotus root", emoji: "🥔"),
                                Allergy(korName: "버섯류", engName: "Mushrooms", emoji: "🍄‍🟫"),
                                Allergy(korName: "깻잎", engName: "Perilla leaf", emoji: "🌿"),
                                Allergy(korName: "감자", engName: "Potatoes", emoji: "🥔"),
                                Allergy(korName: "호박", engName: "Pumpkin", emoji: "🎃"),
                                Allergy(korName: "시금치", engName: "Spinach", emoji: "🥬"),
                                Allergy(korName: "고구마", engName: "Sweet potatoes", emoji: "🍠"),
                                Allergy(korName: "토마토", engName: "Tomato", emoji: "🍅")
                            ]),
            
            AllergyCategory(korName: "양파류", engName: "Onions", emoji: "🧅",
                            allergies: [
                                Allergy(korName: "부추", engName: "Chives", emoji: "🥬"),
                                Allergy(korName: "파", engName: "Spring onion", emoji: "🧅"),
                                Allergy(korName: "리크", engName: "Leeks", emoji: "🥬"),
                                Allergy(korName: "양파", engName: "Onion", emoji: "🧅"),
                                Allergy(korName: "샬롯", engName: "Shallot", emoji: "🧅")
                            ]),
            
            AllergyCategory(korName: "고추류", engName: "Chilli&Pepper", emoji: "🌶️",
                            allergies: [
                                Allergy(korName: "피망", engName: "Bell Pepper", emoji: "🫑"),
                                Allergy(korName: "캡사이신", engName: "Capsaicin", emoji: "🥵"),
                                Allergy(korName: "카이엔 페퍼", engName: "Cayenne Pepper", emoji: "🌶️"),
                                Allergy(korName: "고추", engName: "Chilli", emoji: "🌶️"),
                                Allergy(korName: "하바네로", engName: "Habanero", emoji: "🌶️"),
                                Allergy(korName: "할라피뇨", engName: "Jalapeno", emoji: "🌶️"),
                                Allergy(korName: "파프리카", engName: "Paprika", emoji: "🫑"),
                                Allergy(korName: "후추", engName: "Pepper", emoji: "🧂")
                            ]),
            
            AllergyCategory(korName: "육류", engName: "Meat", emoji: "🍖",
                            allergies: [
                                Allergy(korName: "소고기", engName: "Beef", emoji: "🐂"),
                                Allergy(korName: "닭고기", engName: "Chicken", emoji: "🐓"),
                                Allergy(korName: "오리고기", engName: "Duck", emoji: "🪿"),
                                Allergy(korName: "양고기", engName: "Lamb", emoji: "🐑"),
                                Allergy(korName: "돼지고기", engName: "Pork", emoji: "🐖")
                            ])
        ]
    }
}
            
            
            
