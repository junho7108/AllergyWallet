# AllergyWallet
음식 알레르기로 한국을 여행하시나요? 포괄적인 알레르기 번역 앱으로 안전하게 지내고 걱정 없이 한국 요리를 즐기세요.
  
![image](https://github.com/user-attachments/assets/75798b78-f13d-4e5f-89a5-52f556cd3ce2)

- 별도의 백엔드 개발자가 없어 사용자 정보를 UserDefaults에 저장하도록 구현하였습니다.
- UI Framework는 SwiftUI를 이용하였습니다.
- TCACoordinators 라이브러리를 사용해 화면 전환 및 네비게이션 흐름을 Coordinator에서 처리하여 View에서 네비게이션 관련 로직을 분리하였습니다.
- 알레르기 정보는 저장 된 JSON 파일로부터 받아올 수 있도록 구현되었습니다.
    - 이를 처리하기 위해 FileService를 만들고 Repository 구현체에서 FileService를 이용해 알레르기 정보를 받아올 수 있도록 구현하였습니다.
- Clean Architecture를 적용하여 Domain, Data, Presenter, Uility Layer를 구성하고 각 레이어의 의존성을 관리할 수 있도록 구현하였습니다.
    - Domain Layer
        - Usecase, Repository Protocol, Model이 속합니다.
    - Data Layer
        - Files, Repository, Service, Storage가 속합니다.
    - Presenter Layer
        - UI Model, Feature, View, Coordinator가 속합니다.
    - Utility Layer
        - Const, Extensions, Protocol이 속합니다.
        
현재 모놀리식 아키텍처 구성으로, 추후에 모듈러 아키텍처로 변경하는 것이 목표입니다 :)
